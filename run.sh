#/bin/bash

set -xe

ansible-playbook playbook.yml --tags linux
