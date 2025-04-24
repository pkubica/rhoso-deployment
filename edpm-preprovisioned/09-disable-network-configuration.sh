#!/bin/bash
set -e

echo "Disabling setting up the network on edpm nodes on future deployments"
# osdpns must be marked as not installing so we can patch it
oc wait -f 07-osdpns-machine.yaml --for jsonpath='{.status.conditions[?(@.type=="Ready")].status}'=True
oc patch -f 07-osdpns-machine.yaml -n openstack --type merge -p '{"spec":{"nodeTemplate":{"ansible":{"ansibleVars":{"edpm_network_config_update": false}}}}}'
