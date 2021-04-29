#!/bin/bash
. ./_t/_env

D="entando-helm-quickstart/values.yaml"
cp "_t/files/entando-helm-quickstart--values.gke.yaml" "$D"
sed -i "s/{DOMAIN}/$DOMAIN/g" "$D"
sed -i "s/{SUFFIX}/$SUFFIX/g" "$D"

helm template quickstart --namespace="$NAMESPACE" "entando-helm-quickstart/" > "app--$APPNAME-$NAMESPACE.yaml"
