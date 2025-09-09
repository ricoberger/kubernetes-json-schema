#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

rm -rf crds
mkdir crds

curl -o crds/istio.yaml https://raw.githubusercontent.com/istio/istio/refs/tags/1.27.0/manifests/charts/base/files/crd-all.gen.yaml
