#!/bin/bash

echo "FRIGG: Determining script directory."
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "FRIGG: Script directory set to: $script_dir"

echo "FRIGG: Bootstrapping Frigg bash scripts."
source $script_dir/utils/bootstrap.sh

cd $build_path

if ! [ -d openshift ]; then
  echo "FRIGG: Cloning Openshift from $openshift_git_url."
  git clone $openshift_git_url openshift
fi

cd openshift

if [ -v $openshift_git_ref ] && [[ $openshift_git_ref != '' ]]; then
  echo "FRIGG: Checking out Git reference $openshift_git_ref";
  git checkout $openshift_git_ref
fi

if [ -v $openshift_memory ] && $openshift_memory; then
  echo "FRIGG: Setting memory to $openshift_memory MBs."
  export OPENSHIFT_MEMORY=$openshift_memory
fi

if [ -v $openshift_docker_in_docker ] && [[ $openshift_docker_in_docker == 'true' ]]; then
  echo "FRIGG: Using 'docker-in-docker'."
  export OPENSHIFT_DIND_DEV_CLUSTER=true
fi

if [ -v $openshift_skip_build ] && [[ $openshift_skip_build == 'true' ]]; then
  echo "FRIGG: Skipping Openshift build."
  export OPENSHIFT_SKIP_BUILD=true
fi

echo "FRIGG: Launching Vagrant."
vagrant up

echo "FRIGG: Checking for Openshift binary."
vagrant ssh -c 'which openshift' &> /dev/null

if [[ $? != 0 ]]; then
  echo "FRIGG: Building Openshift."
 # vagrant ssh -c 'cd /dev/data/src/github.com/openshift/origin && make clean build'
fi

echo "Starting Openshift daemon."
vagrant ssh -c 'sudo -b `which openshift` start --public-master=localhost &> openshift.log' &> /dev/null

if [[ $? != 0 ]]; then
  echo "Openshift daemon failed to start. Printing the log at /home/vagrant/openshift.log:"
  vagrant ssh -c'cat openshift.log'
else
  echo "Deploying private docker registry."
  vagrant ssh -c 'sudo chmod +r openshift.local.config/master/openshift-registry.kubeconfig' &> /dev/null
  vagrant ssh -c 'sudo chmod +r openshift.local.config/master/admin.kubeconfig' &> /dev/null
  vagrant ssh -c 'oadm registry --create --credentials=openshift.local.config/master/openshift-registry.kubeconfig --config=openshift.local.config/master/admin.kubeconfig' &> /dev/null

  echo "Loading image stream."
  vagrant ssh -c 'oc create -f /data/src/github.com/openshift/origin/examples/image-streams/image-streams-centos7.json -n openshift --config=openshift.local.config/master/admin.kubeconfig' &> /dev/null

  echo "Loading templates."
  vagrant ssh -c 'oc create -f /data/src/github.com/openshift/origin/examples/sample-app/application-template-stibuild.json -n openshift --config=openshift.local.config/master/admin.kubeconfig' &> /dev/null
  vagrant ssh -c 'oc create -f /data/src/github.com/openshift/origin/examples/db-templates --config=openshift.local.config/master/admin.kubeconfig' &> /dev/null

  echo "You can access your Openshift console at: https://localhost:8443"
fi



