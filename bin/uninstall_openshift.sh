#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $script_dir/utils/bootstrap.sh

# Reset script_dir, which is apparently overridden during bootstrap
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$script_dir/destroy_openshift.sh

cd "$build_path"
if [ -d openshift ]; then
  rm -rf openshift
fi
