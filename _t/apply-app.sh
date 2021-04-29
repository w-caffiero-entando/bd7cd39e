#!/bin/bash
. ./_t/_env

ent k -n "$NAMESPACE" apply -f "./app--$APPNAME-$NAMESPACE.yaml"
