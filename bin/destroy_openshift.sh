#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $script_dir/utils/bootstrap.sh

if [ -v $openshift_docker_in_docker ] && [[ $openshift_docker_in_docker == 'true' ]]; then
  log_info "Using 'docker-in-docker'."
  export OPENSHIFT_DIND_DEV_CLUSTER=true
fi

if [ -d "$build_path/openshift" ]; then
  cd "$build_path/openshift"
  destroy_machines
else
  log_info "No Openshift directory found."
fi
