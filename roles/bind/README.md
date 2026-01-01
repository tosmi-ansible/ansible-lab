Role Name
=========

bind

A brief description of the role goes here.

This role installs ISC BIND DNS server and deploys a BIND configuration.

Requirements
------------

- RHEL/CentOS/Fedora or similar distribution with `dnf` or `yum` package manager
- Root or sudo access to install packages and manage services

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml`):

- `bind_package`: Package name for BIND (default: `bind`)
- `bind_service`: Service name for BIND (default: `named`)
- `bind_config_path`: Path to BIND configuration file (default: `/etc/named.conf`)
- `bind_zones_directory`: Directory for zone files (default: `/var/named`)
- `bind_listen_on`: List of interfaces to listen on (empty list means all interfaces)
- `bind_listen_port`: Port to listen on (default: `53`)
- `bind_allow_query`: List of networks allowed to query (empty list means allow all)
- `bind_recursion`: Enable recursion (default: `yes`)
- `bind_forwarders`: List of forwarder DNS servers (empty list means no forwarders)
- `bind_zones`: List of zone definitions (see example below)
- `bind_includes`: List of additional configuration files to include
- `bind_user`: User to run BIND as (default: `named`)
- `bind_group`: Group to run BIND as (default: `named`)

Zone Configuration Example
--------------------------

```yaml
bind_zones:
  - name: example.com
    type: master
    file: example.com.zone
    allow_update: []
  - name: example.org
    type: slave
    file: example.org.zone
    masters:
      - 192.168.1.10
```

Dependencies
------------

None

Example Playbook
----------------

Basic usage:

```yaml
- hosts: dns_servers
  roles:
    - bind
```

With custom configuration:

```yaml
- hosts: dns_servers
  roles:
    - role: bind
      vars:
        bind_listen_on:
          - 127.0.0.1
          - 192.168.1.10
        bind_allow_query:
          - 192.168.1.0/24
          - 10.0.0.0/8
        bind_forwarders:
          - 8.8.8.8
          - 8.8.4.4
        bind_zones:
          - name: example.com
            type: master
            file: example.com.zone
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).




