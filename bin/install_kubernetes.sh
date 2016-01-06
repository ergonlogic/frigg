#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $script_dir/utils/bootstrap.sh

export KUBERNETES_PROVIDER=vagrant
echo "Set provider to $KUBERNETES_PROVIDER."

if [[ $(which wget) ]]; then
  wget -q -O - https://get.k8s.io | bash
elif [[ $(which curl) ]]; then
  curl -sS https://get.k8s.io | bash
else
  echo "Couldn't find curl or wget.  Bailing out."
  exit 1
fi


