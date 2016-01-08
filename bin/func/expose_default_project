#!/bin/bash

expose_default_project() {

  log_info "Making 'default' project visible to 'vagrant' user in web console."
  oc_cmd "oc policy add-role-to-user admin vagrant -n default"

}
