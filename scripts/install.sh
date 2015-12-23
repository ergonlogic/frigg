#!/bin/bash

export KUBERNETES_PROVIDER=vagrant

if [[ $(which wget) ]]; then
  wget -q -O - https://get.k8s.io | bash
elif [[ $(which curl) ]]; then
  curl -sS https://get.k8s.io | bash
else
  echo "Couldn't find curl or wget.  Bailing out."
  exit 1
fi


