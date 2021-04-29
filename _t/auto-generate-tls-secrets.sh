#!/bin/bash
. ./_t/_env

(
  cd certs
  ../_t/generate-cert.sh "$DOMAIN"
)

D="certs/tls-secret.yaml"
cp "_t/files/tls-secret.yaml.template" "$D"

cat "certs/$DOMAIN.crt" | xargs -L 1 -I {} echo "    {}" > certs/.tmp
sed -i -e '/{CERT}/{r certs/.tmp' -e 'd}' "$D"

cat "certs/$DOMAIN.key" | xargs -L 1 -I {} echo "    {}" > certs/.tmp
sed -i -e '/{KEY}/{r certs/.tmp' -e 'd}' "$D"

D="certs/ca-cert-secret.yaml"
cp "_t/files/ca-cert-secret.yaml.template" "$D"

cat "certs/$DOMAIN.crt" | xargs -L 1 -I {} echo "    {}" > certs/.tmp
sed -i -e '/{CERT}/{r certs/.tmp' -e 'd}' "$D"
