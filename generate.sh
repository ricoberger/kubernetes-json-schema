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

KUBECTL_PROXY_HOST=127.0.0.1
if [ "$(uname)" == "Darwin" ]; then
  KUBECTL_PROXY_HOST=host.docker.internal
fi

sleep 5

# Generate JSON schemas for all Kubernetes resources and
# CustomResourceDefinitions (CRDs) of the kind cluster and store them in the
# 'schemas' directory
rm -rf schemas
mkdir -p schemas

OPENAPI2JSONSCHEMABIN="docker run --network=host -i -v ${PWD}/schemas:/out/schemas ghcr.io/ricoberger/kubernetes-json-schema/openapi2jsonschema:main"
# SCHEMA=http://host.docker.internal:5555/openapi/v2
SCHEMA=http://$KUBECTL_PROXY_HOST:5555/openapi/v2

$OPENAPI2JSONSCHEMABIN -o "schemas" --expanded --kubernetes --stand-alone "${SCHEMA}"

# Stop the 'kubectl proxy' command
kill $KUBECTL_PROXY_PID
