#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

rm -rf crds
mkdir crds

# cert-manager
curl -L -o crds/cert-manager.yaml https://github.com/cert-manager/cert-manager/releases/download/v1.18.2/cert-manager.crds.yaml

# ClickHouse Operator
curl -L -o crds/clickhouse-operator-clickhousekeeperinstallations.yaml https://raw.githubusercontent.com/Altinity/clickhouse-operator/refs/tags/release-0.25.3/deploy/helm/clickhouse-operator/crds/CustomResourceDefinition-clickhousekeeperinstallations.clickhouse-keeper.altinity.com.yaml
curl -L -o crds/clickhouse-operator-clickhouseinstallationtemplates.yaml https://raw.githubusercontent.com/Altinity/clickhouse-operator/refs/tags/release-0.25.3/deploy/helm/clickhouse-operator/crds/CustomResourceDefinition-clickhouseinstallationtemplates.clickhouse.altinity.com.yaml
curl -L -o crds/clickhouse-operator-clickhouseinstallations.yaml https://raw.githubusercontent.com/Altinity/clickhouse-operator/refs/tags/release-0.25.3/deploy/helm/clickhouse-operator/crds/CustomResourceDefinition-clickhouseinstallations.clickhouse.altinity.com.yaml

# Elasticsearch Operator
curl -L -o crds/elasticsearch-operator.yaml https://raw.githubusercontent.com/elastic/cloud-on-k8s/refs/tags/v3.1.0/config/crds/v1/all-crds.yaml

# Flux
# See https://github.com/fluxcd/flux2/blob/v2.6.4/manifests/crds/kustomization.yaml
curl -L -o crds/flux-source-controller.yaml https://github.com/fluxcd/source-controller/releases/download/v1.6.2/source-controller.crds.yaml
curl -L -o crds/flux-kustomize-controller.yaml https://github.com/fluxcd/kustomize-controller/releases/download/v1.6.1/kustomize-controller.crds.yaml
curl -L -o crds/flux-helm-controller.yaml https://github.com/fluxcd/helm-controller/releases/download/v1.3.0/helm-controller.crds.yaml
curl -L -o crds/flux-notification-controller.yaml https://github.com/fluxcd/notification-controller/releases/download/v1.6.0/notification-controller.crds.yaml
curl -L -o crds/flux-image-reflector-controller.yaml https://github.com/fluxcd/image-reflector-controller/releases/download/v0.35.2/image-reflector-controller.crds.yaml
curl -L -o crds/flux-image-automation-controller.yaml https://github.com/fluxcd/image-automation-controller/releases/download/v0.41.2/image-automation-controller.crds.yaml

# Gateway API
curl -L -o crds/gateway-api.yaml https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.3.0/standard-install.yaml

# Istio
curl -L -o crds/istio.yaml https://raw.githubusercontent.com/istio/istio/refs/tags/1.27.0/manifests/charts/base/files/crd-all.gen.yaml

# Keda
curl -L -o crds/keda.yaml https://github.com/kedacore/keda/releases/download/v2.17.2/keda-2.17.2-crds.yaml

# Kyverno
curl -L -o crds/kyverno-cleanuppolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/kyverno.io_cleanuppolicies.yaml
curl -L -o crds/kyverno-clustercleanuppolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/kyverno.io_clustercleanuppolicies.yaml
curl -L -o crds/kyverno-clusterpolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/kyverno.io_clusterpolicies.yaml
curl -L -o crds/kyverno-globalcontextentries.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/kyverno.io_globalcontextentries.yaml
curl -L -o crds/kyverno-policies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/kyverno.io_policies.yaml
curl -L -o crds/kyverno-policyexceptions.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/kyverno.io_policyexceptions.yaml
curl -L -o crds/kyverno-updaterequests.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/kyverno.io_updaterequests.yaml
curl -L -o crds/kyverno-deletingpolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/policies.kyverno.io_deletingpolicies.yaml
curl -L -o crds/kyverno-generatingpolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/policies.kyverno.io_generatingpolicies.yaml
curl -L -o crds/kyverno-imagevalidatingpolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/policies.kyverno.io_imagevalidatingpolicies.yaml
curl -L -o crds/kyverno-mutatingpolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/policies.kyverno.io_mutatingpolicies.yaml
curl -L -o crds/kyverno-policyexceptions.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/policies.kyverno.io_policyexceptions.yaml
curl -L -o crds/kyverno-validatingpolicies.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/policies.kyverno.io_validatingpolicies.yaml
curl -L -o crds/kyverno-clusterephemeralreports.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/reports.kyverno.io_clusterephemeralreports.yaml
curl -L -o crds/kyverno-ephemeralreports.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/reports.kyverno.io_ephemeralreports.yaml
curl -L -o crds/kyverno-clusterpolicyreports.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/wgpolicyk8s.io_clusterpolicyreports.yaml
curl -L -o crds/kyverno-policyreports.yaml https://github.com/kyverno/kyverno/releases/download/v1.15.1/wgpolicyk8s.io_policyreports.yaml

# NATS Controllers for Kubernetes (NACK)
curl -L -o crds/nack.yaml https://github.com/nats-io/nack/releases/download/v0.19.2/crds.yml

# Parca Operator
curl -L -o crds/parca-operator.yaml https://raw.githubusercontent.com/ricoberger/parca-operator/refs/tags/v0.5.0/charts/parca-operator/crds/parca.ricoberger.de_parcascrapeconfigs.yaml

# Sloth
curl -L -o crds/sloth.yaml https://raw.githubusercontent.com/slok/sloth/refs/tags/v0.13.0/deploy/kubernetes/helm/sloth/crds/sloth.slok.dev_prometheusservicelevels.yaml

# Strimzi
curl -L -o crds/strimzi.yaml https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.47.0/strimzi-crds-0.47.0.yaml

# Vault Secrets Operator
curl -L -o crds/vault-secrets-operator.yaml https://raw.githubusercontent.com/ricoberger/vault-secrets-operator/refs/tags/v1.26.2/charts/vault-secrets-operator/crds/ricoberger.de_vaultsecrets.yaml

# Vertical Pod Autoscaler
curl -L -o crds/vertical-pod-autoscaler.yaml https://raw.githubusercontent.com/kubernetes/autoscaler/refs/tags/vertical-pod-autoscaler-1.4.2/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml

# VictoriaMetrics Operator
curl -L -o crds/victoriametrics-operator.yaml https://github.com/VictoriaMetrics/operator/releases/download/v0.62.0/crd.yaml

# Zalando Postgres Operator
curl -L -o crds/zalando-postgres-operator-operatorconfigurations.yaml https://raw.githubusercontent.com/zalando/postgres-operator/refs/tags/v1.14.0/charts/postgres-operator/crds/operatorconfigurations.yaml
curl -L -o crds/zalando-postgres-operator-postgresqls.yaml https://raw.githubusercontent.com/zalando/postgres-operator/refs/tags/v1.14.0/charts/postgres-operator/crds/postgresqls.yaml
curl -L -o crds/zalando-postgres-operator-postgresteams.yaml https://raw.githubusercontent.com/zalando/postgres-operator/refs/tags/v1.14.0/charts/postgres-operator/crds/postgresteams.yaml
