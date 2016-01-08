#!/bin/bash

clone_openshift() {
  if ! [ -d openshift ]; then
    log_info "Cloning Openshift from $openshift_git_url."
    git clone $openshift_git_url openshift
  fi


  if [ -v $openshift_git_ref ] && [[ $openshift_git_ref != '' ]]; then
    log_info "Checking out Git reference $openshift_git_ref";
    cd openshift
    git checkout $openshift_git_ref
  fi
}
