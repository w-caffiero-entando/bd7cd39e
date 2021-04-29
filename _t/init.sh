#!/bin/bash

[ -f "_env.local" ] && echo "the current dir appears to be already initialized" && exit 1

echo "> Retrieving the entando helm quickstart"

git clone "https://github.com/entando-k8s/entando-helm-quickstart.git" "entando-helm-quickstart"

(
  cd "entando-helm-quickstart"
  git checkout -b "v6.3.0" || exit 1
  rm .git -rf
)

echo "> Retrieving the entando CRDs"

curl -L -C - "https://raw.githubusercontent.com/entando/entando-releases/v6.3.0/dist/qs/custom-resources.tar.gz" | tar -xz

echo "> Creating base dirs and links"

mkdir certs
chmod 700 certs -R

cp _t/files/* .
cp _t/files/.gitignore .

echo "> completed."
