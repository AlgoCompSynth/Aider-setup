#! /usr/bin/env bash

set -e

echo "*** Large Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  qwen3-coder:30b \
  glm-4.7-flash:q4_K_M \
  nemotron-3-nano:30b

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Large Models ***"
echo ""
