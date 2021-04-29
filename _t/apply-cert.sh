#!/bin/bash
. ./_t/_env

ent k -n "$NAMESPACE" apply -f "certs/ca-cert-secret.yaml"
ent k -n "$NAMESPACE" apply -f "certs/tls-secret.yaml"
