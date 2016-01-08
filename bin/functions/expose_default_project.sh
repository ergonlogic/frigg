#!/bin/bash

expose_default_project() {

  log_info "Making 'default' project visible to 'vagrant' user in web console."
  vagrant_cmd "oc policy add-role-to-user admin vagrant -n default --config=$vagrant_home/$openshift_kubeconfig"

}
