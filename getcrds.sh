#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

rm -rf crds
mkdir crds

# cert-manager
curl -L -o crds/cert-manager.yaml https://github.com/cert-manager/cert-manager/releases/download/v1.18.2/cert-manager.crds.yaml

# Flux
# See https://github.com/fluxcd/flux2/blob/v2.6.4/manifests/crds/kustomization.yaml
curl -L -o crds/flux-source-controller.yaml https://github.com/fluxcd/source-controller/releases/download/v1.6.2/source-controller.crds.yaml
curl -L -o crds/flux-kustomize-controller.yaml https://github.com/fluxcd/kustomize-controller/releases/download/v1.6.1/kustomize-controller.crds.yaml
curl -L -o crds/flux-helm-controller.yaml https://github.com/fluxcd/helm-controller/releases/download/v1.3.0/helm-controller.crds.yaml
curl -L -o crds/flux-notification-controller.yaml https://github.com/fluxcd/notification-controller/releases/download/v1.6.0/notification-controller.crds.yaml
curl -L -o crds/flux-image-reflector-controller.yaml https://github.com/fluxcd/image-reflector-controller/releases/download/v0.35.2/image-reflector-controller.crds.yaml
curl -L -o crds/flux-image-automation-controller.yaml https://github.com/fluxcd/image-automation-controller/releases/download/v0.41.2/image-automation-controller.crds.yaml

# Istio
curl -L -o crds/istio.yaml https://raw.githubusercontent.com/istio/istio/refs/tags/1.27.0/manifests/charts/base/files/crd-all.gen.yaml

# Keda
curl -L -o crds/keda.yaml https://github.com/kedacore/keda/releases/download/v2.17.2/keda-2.17.2-crds.yaml

# Strimzi
curl -L -o crds/strimzi.yaml https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.47.0/strimzi-crds-0.47.0.yaml

# Vertical Pod Autoscaler
curl -L -o crds/vertical-pod-autoscaler.yaml https://raw.githubusercontent.com/kubernetes/autoscaler/refs/tags/vertical-pod-autoscaler-1.4.2/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml

# VictoriaMetrics Operator
curl -L -o crds/victoriametrics-operator.yaml https://github.com/VictoriaMetrics/operator/releases/download/v0.62.0/crd.yaml
