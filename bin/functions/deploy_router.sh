#!/bin/bash

deploy_router() {

  log_info "Deploying private docker registry."
#  vagrant_cmd "echo '{\"kind\":\"ServiceAccount\",\"apiVersion\":\"v1\",\"metadata\":{\"name\":\"router\"}}' | oc create -f - --config $vagrant_home/$openshift_kubeconfig"
  #oc edit scc privileged --config $vagrant_home/$openshift_kubeconfig
#  vagrant_cmd "sudo chmod a+r $vagrant_home/openshift.local.config/master/openshift-router.kubeconfig"
#  vagrant_cmd "oadm router --credentials="$vagrant_home/openshift.local.config/master/openshift-router.kubeconfig" --service-account=router --config $vagrant_home/$openshift_kubeconfig"

}
