#!/bin/bash
set -e

echo "Replacing password from subscription-manager and redhat-registry credentials with fake one"
oc patch secret subscription-manager -n openstack --type merge -p '{"data":{"password": "fake"}}'
oc patch secret redhat-registry -n openstack --type merge -p '{"data":{"edpm_container_registry_logins": "fake"}}'

