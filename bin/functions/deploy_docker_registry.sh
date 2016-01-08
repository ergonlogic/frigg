#!/bin/bash

deploy_docker_registry() {

  log_info "Deploying private docker registry."
  vagrant_cmd 'sudo chmod a+r openshift.local.config/master/openshift-registry.kubeconfig'
  oc_cmd "oadm registry --create --credentials=openshift.local.config/master/openshift-registry.kubeconfig"

}
