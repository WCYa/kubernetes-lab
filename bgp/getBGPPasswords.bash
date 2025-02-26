#!/bin/bash

printf "fortigate:"
kubectl get secret bgp-passwords -n kube-system -o jsonpath="{.data.fortigate}" | base64 --decode
