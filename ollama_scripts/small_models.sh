#! /usr/bin/env bash

set -e

echo "*** Small Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:13b \
  codestral:22b \
  deepseek-coder-v2:16b \
  deepseek-v2:16b \
  dolphin3:8b \
  gpt-oss:20b \
  llama3.1:8b \
  magistral:24b \
  mistral-small3.2:24b \
  phi3:14b \
  qwen3:14b \

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Small Models ***"
echo ""
