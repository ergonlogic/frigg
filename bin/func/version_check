#!/bin/bash

version_check() {
  log_debug "Checking Bash version."
  version_compare $BASH_VERSION "4.2"
  if [[ $? == 2 ]]; then
    log_error "Frigg requires Bash version 4.2 or greater. Currently using $BASH_VERSION. Please upgrade to a more recent version and try again."
    exit 1
  else
    log_debug "Version check passed."
  fi
}
