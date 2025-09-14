#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Create a kind cluster
kind create cluster --image=kindest/node:v1.34.0
sleep 5

# Apply all CustomResourceDefinitions (CRDs) from the 'crds' directory
kubectl apply --server-side -f crds/
sleep 5

# Create a kubectl proxy to access the Kubernetes API of the kind cluster and
# determine the IP address we can use for Docker
nohup kubectl proxy --port=5555 --accept-hosts='^.*' > /dev/null 2>&1 &
KUBECTL_PROXY_PID=$!

sleep 5

# Generate JSON schemas for all Kubernetes resources and
# CustomResourceDefinitions (CRDs) of the kind cluster and store them in the
# 'schemas' directory
rm -rf schemas
mkdir -p schemas

OPENAPI2JSONSCHEMABIN="./utilities/openapi2jsonschema.py"
SCHEMA=http://127.0.0.1:5555/openapi/v2

$OPENAPI2JSONSCHEMABIN "schemas" "${SCHEMA}"

# Stop the 'kubectl proxy' command
kill $KUBECTL_PROXY_PID

# Delete the kind cluster
kind delete cluster
