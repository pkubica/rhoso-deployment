#!/bin/bash
set -e

echo "Discovering compute nodes"
oc rsh nova-cell0-conductor-0 nova-manage cell_v2 discover_hosts --verbose
