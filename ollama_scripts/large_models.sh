#! /usr/bin/env bash

set -e

echo "*** Large Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codestral:latest \
  deepseek-coder-v2:latest \
  devstral-small-2:latest \
  glm-4.7-flash:latest \
  gpt-oss:latest \
  qwen3-coder:latest

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Large Models ***"
echo ""
