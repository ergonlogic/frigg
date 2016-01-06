#!/bin/bash

version_check() {
  version_compare $BASH_VERSION "4.2"
  if [[ $? == 2 ]]; then
    echo "Frigg requires Bash version 4.2 or greater. Currently using $BASH_VERSION. Please upgrade to a more recent version and try again."
    exit 1
  fi
}
