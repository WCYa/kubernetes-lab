#!/bin/bash

export BGP_PASSWORD_PEER_FORTIGATE="$(openssl rand -base64 12 | base64)"

envsubst < bgp-passwords.yaml | kubectl create -f -
