Frigg
=====

This project is a prototype for AegirNG, a ground-up re-write of Aegir atop
Openshift, Kubernetes and Docker.

To get started:

    $ git clone --recursive https://github.com/ergonlogic/frigg.git
    $ cd frigg
    $ LOG_LEVEL=debug ./bin/cmd/oc/install

This will clone this repo, including the documentation as a submodule, then
build and launch Openshift in a Vagrant VM. This may take a while the first
time, as it will have to download a new basebox. Subsequent rebuilds of the
Vagrant environment will be much quicker.

You'll need to have relatively recent versions of the following software
installed:
 * [Vagrant](https://vagrantup.com) (1.7+)
 * [VirtualBox](https://virtualbox.org) (4+)
 * [Bash](https://www.gnu.org/software/bash/) (4.2+).
