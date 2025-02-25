#!/bin/bash

kubectl get secret mailpit-crt-secret -n development -o jsonpath='{.data.tls\.crt}' | base64 -d > tls.crt
kubectl get secret mailpit-crt-secret -n development -o jsonpath='{.data.tls\.key}' | base64 -d > tls.key
kubectl get secret mailpit-crt-secret -n development -o jsonpath='{.data.ca\.crt}' | base64 -d > ca.crt

cat tls.crt ca.crt > fullchain.crt

kubectl create secret tls mailpit-fullchain-crt-secret \
    --cert=fullchain.crt \
    --key=tls.key \
    --namespace development
