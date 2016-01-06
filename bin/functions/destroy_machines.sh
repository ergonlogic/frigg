#!/bin/bash

# Destroy all Vagrant machines within a project.

function destroy_machines {
  machines=( $( get_machines ) )
  for machine in $machines; do
    vagrant destroy -f "$machine"
  done
}
