#!/bin/bash
vagrant_up() {
  if [ -v $openshift_memory ] && $openshift_memory; then
    log_debug "Setting memory to $openshift_memory MBs."
    export OPENSHIFT_MEMORY=$openshift_memory
  fi

  if [ -v $openshift_docker_in_docker ] && [[ $openshift_docker_in_docker == 'true' ]]; then
    log_debug "Using 'docker-in-docker'."
    export OPENSHIFT_DIND_DEV_CLUSTER=true
  fi

  if [ -v $openshift_skip_build ] && [[ $openshift_skip_build == 'true' ]]; then
    log_debug "Skipping Openshift build."
    export OPENSHIFT_SKIP_BUILD=true
  fi

  log_info "Launching Vagrant."
  vagrant up
}
