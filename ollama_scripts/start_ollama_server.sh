#! /usr/bin/env bash

set -e

echo "*** Start Ollama Server ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

ollama serve > $LOGFILES/ollama-serve.log 2>&1 &
sleep 15

list_models.sh

echo "*** Finished Start Ollama Server ***"
echo ""
