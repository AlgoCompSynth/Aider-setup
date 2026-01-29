#! /usr/bin/env bash

set -e

echo "*** Small Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:latest \
  deepseek-r1:latest \
  dolphin3:latest \
  llama3.1:latest \
  mistral:latest\
  mistral-nemo:latest \
  phi3:latest

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Small Models ***"
echo ""
