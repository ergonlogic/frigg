#!/bin/bash

load_image_streams() {

  log_info "Loading image stream."
  vagrant_cmd "oc create -f $openshift_path/examples/image-streams/image-streams-centos7.json -n openshift --config=$vagrant_home/$openshift_kubeconfig"

}
