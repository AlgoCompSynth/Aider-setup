#! /usr/bin/env bash

set -e

echo "*** Large Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codestral:22b \
  deepseek-coder-v2:16b \
  devstral-small-2:24b \
  glm-4.7-flash:q4_K_M \
  gpt-oss:20b \
  qwen3-coder:30b

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Large Models ***"
echo ""
