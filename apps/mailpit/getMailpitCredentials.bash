#!/bin/bash

kubectl get secret mailpit-secret -n development -o jsonpath="{.data.MP_UI_AUTH}" | base64 --decode && echo
