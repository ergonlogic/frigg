#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $script_dir/utils/bootstrap.sh

if [ -v $openshift_docker_in_docker ] && [[ $openshift_docker_in_docker == 'true' ]]; then
  echo "FRIGG: Using 'docker-in-docker'."
  export OPENSHIFT_DIND_DEV_CLUSTER=true
fi

cd "$build_path/openshift"
destroy_machines
