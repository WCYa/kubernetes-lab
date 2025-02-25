#!/bin/bash

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.17.0/cert-manager.yaml

kubectl get pods -w --namespace cert-manager

