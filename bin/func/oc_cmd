#!/bin/bash

# Set a default configuration file, rather than requiring --config for each
# invocation.

oc_cmd() {
  vagrant_cmd "KUBECONFIG=$vagrant_home/$openshift_kubeconfig $@"
}
