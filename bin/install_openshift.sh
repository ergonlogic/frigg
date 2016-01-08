#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $script_dir/utils/bootstrap.sh

cd $build_path

clone_openshift

cd openshift

vagrant_up
build_openshift
start_openshift
deploy_docker_registry
load_image_streams
load_templates
expose_default_project
deploy_router

