#!/bin/bash
set -e

echo "Waiting for the deployment of RHOSO on EDPM nodes"
oc wait -f 08-osdpd.yaml --for condition=Ready --timeout=90m
