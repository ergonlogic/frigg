#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $script_dir/utils/bootstrap.sh

cd $build_path/openshift
vagrant ssh

