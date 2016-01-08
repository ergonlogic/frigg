#!/bin/bash

start_openshift() {

  log_info "Starting Openshift daemon."
  vagrant_cmd 'sudo -b `which openshift` start --public-master=localhost &> openshift.log'

  if [[ $? != 0 ]]; then
    log_error "Openshift daemon failed to start. Printing the log at /home/vagrant/openshift.log:"
    vagrant_cmd 'cat openshift.log'
    exit 1
  else
    log_success "Openshift started."

    log_debug "Ensuring default Kubernetes config file is readable."
    vagrant_cmd "sudo chmod a+r $vagrant_home/$openshift_kubeconfig"

    log_notice "You can access your Openshift console at:"
    log_notice "    URL: https://localhost:8443"
    log_notice "    User: vagrant"
    log_notice "    Password: vagrant"
  fi

}
