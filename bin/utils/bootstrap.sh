#!/bin/bash

bootstrap_script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$bootstrap_script_dir/log.sh"
frigg_dir="$( dirname $script_dir )"

frigg_functions=("$frigg_dir/functions/*.sh")
for file in $frigg_functions; do
  log_debug "Sourcing $file"
  source "$file"
done

version_check

log_debug "Loading config variables."
eval $(parse_yaml frigg.yml)

if ! [ -d "$build_path" ]; then
  log_debug "Creating build path $build_path."
  mkdir -p $build_path
fi
