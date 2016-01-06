#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $script_dir/utils/bootstrap.sh

$script_dir/destroy_openshift.sh

cd "$build_path"
rm -rf openshift
