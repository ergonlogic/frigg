#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
frigg_dir="$( dirname $script_dir )"
functions=("$frigg_dir/functions/*.sh")
for file in $functions; do
  echo "Sourcing $file"
  source "$file"
done

version_check

echo "Loading config variables."
eval $(parse_yaml frigg.yml)

if ! [ -d "$build_path" ]; then
  echo "Creating build path."
  mkdir $build_path
fi
