#! /usr/bin/env bash

set -e

echo "*** Small Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:13b \
  deepseek-r1:8b \
  dolphin3:8b \
  llama3.1:8b \
  mistral:7b\
  mistral-nemo:12b \
  phi3:14b

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Small Models ***"
echo ""
