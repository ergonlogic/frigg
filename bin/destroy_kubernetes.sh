#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $script_dir/utils/bootstrap.sh

cd "$build_path/kubernetes"
machines=$( vagrant status --machine-readable | awk -F "\"*,\"*" '{print $2}' | uniq )
for machine in $machines; do
  vagrant destroy -f "$machine"
done
