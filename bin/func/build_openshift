#!/bin/bash

build_openshift() {
  log_info "Checking for Openshift binary."
  vagrant ssh -c 'which openshift' &> /dev/null

  if [[ $? != 0 ]]; then
    log_info "Building Openshift."
    vagrant_cmd "cd $openshift_path && make clean build"
  fi
}
