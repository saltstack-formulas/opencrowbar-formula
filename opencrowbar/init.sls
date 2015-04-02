iptables:
  service.dead

permissive:
  selinux.mode

{% if use_develop is True %}
ocb-develop:
  pkgrepo.managed:
    - humanname: develop repo for opencrowbar RPMs
    - baseurl: http://opencrowbar.s3-website-us-east-1.amazonaws.com/develop
{% else %}
ocb-master:
  pkgrepo.managed:
    - humanname: master repo for opencrowbar RPMs
    - baseurl: http://opencrowbar.s3-website-us-east-1.amazonaws.com/el6
{% endif %}
    - enabled: 1
    - gpgcheck: 0
    - type: none
    - autorefresh: 1
    - keeppackages: 1

{% if use_hardware is True %}
opencrowbar-hardware:
  pkg.installed:
    - require:
      - pkgrepo: hardware
{% else %}
opencrowbar-core:
  pkg.installed:
    - require:
      - pkgrepo: develop
{% endif %}

/tftpboot/isos:
  file.directory:
    - makedirs: True

{% if with_download is True %}
centos_download:
  file.managed:
    - name: /tftpboot/isos/CentOS-7-x86_64-DVD-1503.iso
    - source: http://mirrors.kernel.org/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1503.iso
    - source_hash: md5=99e450fb1b22d2e528757653fcbf5fdc
    - require:
      - file: /tftpboot/isos
{% endif %}

{% if use_hardware is True %}
/tftpboot/files/raid:
  file.directory:
    - makedirs: True
{% endif %}
