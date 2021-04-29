#!/bin/bash
. ./_t/_env

ent k -n "$NAMESPACE" apply -f "./dist/crd/"
