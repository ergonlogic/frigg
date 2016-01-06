#!/bin/bash

# Return a list of Vagrant machine names.
#
# Usage:
#
#   machines=( $(get_machines) )
#
# Since it's impractical to return arrays from shell functions, we return a
# simple list here. This can easily be accessed as an array by calling it as
# suggested above.

function get_machines {
  machines=$( vagrant status --machine-readable | awk -F "\"*,\"*" '{print $2}' | uniq )
  echo "${machines[@]}"
}
