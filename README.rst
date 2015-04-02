===========
opencrowbar
===========

Formulas to set up and configure the OpenCrowbar Project.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

.. note::

    Information about OpenCrowbar can be found at `their GitHub page
    <https://github.com/opencrowbar/core>`_.


For those familiar with OpenCrowbar, but less so with SaltStack.  Do the following within a basic CentOS-6.6 system:

  * yum install -y epel-release
  * yum install -y salt-minion
  * yum install -y git
  * mkdir -p /srv/salt
  * git clone https://github.com/saltstack-formulas/opencrowbar-formula.git
  * cp -r opencrowbar-formula/opencrowbar /srv/salt
  * salt-call --local state.sls opencrowbar
  * cd /opt/opencrowbar/core
  * ./production.sh <FQDN of Node>
  
If a bare metal or virtual machine is not available, a docker container works as well with this command:
  * docker run -t -i --privileged centos:centos6 /bin/bash -i
