#!/bin/bash

load_templates() {

  log_info "Loading templates."
  vagrant_cmd "oc create -f $openshift_path/examples/sample-app/application-template-stibuild.json -n openshift --config=$vagrant_home/$openshift_kubeconfig"
  vagrant_cmd "oc create -f $openshift_path/examples/db-templates --config=$vagrant_home/$openshift_kubeconfig"

}
