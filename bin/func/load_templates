#!/bin/bash

load_templates() {

  log_info "Loading templates."
  oc_cmd "oc create -f $openshift_path/examples/sample-app/application-template-stibuild.json -n openshift"
  oc_cmd "oc create -f $openshift_path/examples/db-templates"

}
