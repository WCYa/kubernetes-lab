#!/bin/bash

tmp_dir="$(mktemp -d)"

export ADMIN_PASSWORD="$(openssl rand -base64 12)"

envsubst < kustomization.yaml > "${tmp_dir}/kustomization.yaml"
kubectl create -k "${tmp_dir}"

/usr/bin/rm -rf "${tmp_dir}"

