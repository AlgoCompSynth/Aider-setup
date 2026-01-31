#! /usr/bin/env bash

set -e

echo "*** Small Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  deepseek-coder-v2:16b \
  gpt-oss:20b \
  devstral-small-2:24b-instruct-2512-q4_K_M

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Small Models ***"
echo ""
