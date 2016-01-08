Aegir Project
=============

This project is a prototype for AegirNG, a ground-up re-write of Aegir atop Openshift and Kubernetes.

To get started:

    $ git clone --recursive https://github.com/ergonlogic/frigg.git
    $ cd frigg
    $ LOG_LEVEL=debug ./bin/install_openshift.sh

This will clone this repo, including the documentation as a submodule, then
clone the Openshift Origin repo, and launch an all-in-one Vagrant-based
install. This last step may take a while the first time, as it will have to
download a new basebox. Subsequent rebuilds of the Vagrant environment will be
much quicker.

As such, you'll need to have [Vagrant](https://vagrantup.com) and
[VirtualBox](https://virtualbox.org) installed, along with a relatively recent
version of Bash (4.2+).
