#! /usr/bin/env bash

set -e

echo "*** Stop Ollama Server ***"
pkill -e -f "ollama serve" || true
echo "*** Finished Stop Ollama Server ***"
echo ""
