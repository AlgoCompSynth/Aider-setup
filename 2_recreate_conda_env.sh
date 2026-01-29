#! /bin/bash

set -e

source set_envars
export LOGFILE=$LOGFILES/recreate_conda_env.log
rm --force $LOGFILE

echo ""
echo "Enabling 'conda'"
source $MINIFORGE3_HOME/etc/profile.d/conda.sh
echo "Activating 'base'"
conda activate base
echo "PATH: $PATH" \
  >> $LOGFILE 2>&1

echo ""
echo "Recreating 'aider' virtual environment"
/usr/bin/time conda env create --quiet --yes --file conda-env-$COMPUTE_MODE.yml \
  >> $LOGFILE 2>&1

echo "Activating 'aider' virtual environment"
conda deactivate
conda activate aider

echo "Listing"
conda list > aider.log

echo "Installing aider"
aider-install
which aider
conda deactivate

echo "Copying ollama scripts to $MINIFORGE3_HOME/envs/aider/bin/"
cp ollama_scripts/*.sh $MINIFORGE3_HOME/envs/aider/bin/

echo "Finished"
