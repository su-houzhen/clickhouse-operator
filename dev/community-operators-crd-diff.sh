#!/bin/bash

# Source configuration
CUR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "${CUR_DIR}/go_build_config.sh"

# Where community-operators sources are located
CO_PATH=~/dev/community-operators/operators/clickhouse/${VERSION}

# Ask to prepare copy of required files
echo "Please ensure new version ${VERSION} is already available by the following path:"
echo "${CO_PATH}"
echo "Copy files from previous version and edit them accordingly."
read -n 1 -r -s -p $'Press enter to continue...\n'

if [[ ! -d "${CO_PATH}" ]]; then
    echo "No ${CO_PATH} available! Abort."
    exit 1
fi

# Compare
meld "${MANIFESTS_ROOT}"/dev/clickhouse-operator-install-yaml-template-01-section-crd-01-chi.yaml      "${CO_PATH}"/clickhouseinstallations.clickhouse.radondb.com.crd.yaml
meld "${MANIFESTS_ROOT}"/dev/clickhouse-operator-install-yaml-template-01-section-crd-02-chit.yaml     "${CO_PATH}"/clickhouseinstallationtemplates.clickhouse.radondb.com.crd.yaml
meld "${MANIFESTS_ROOT}"/dev/clickhouse-operator-install-yaml-template-01-section-crd-03-chopconf.yaml "${CO_PATH}"/clickhouseoperatorconfigurations.clickhouse.radondb.com.crd.yaml
