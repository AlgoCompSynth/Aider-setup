# Aider-setup
Set up an Aider / Ollama `conda` environment in a container

## Usage

***Warning! This repository is only designed for use as a git submodule
to add Aider - Ollama tools to containers. It is not intended for end-user
applications. If you want to use Aider and Ollama as an end user, please
consult the [Aider documentation](https://aider.chat/) and the
[Ollama documentation](https://ollama.com/).***

### Installation

1. `./1_reinstall_miniforge3.sh`. This will remove any existing
`$HOME/miniforge3` installation and install a fresh copy.
2. `./2_recreate_conda_env.sh`. This will create a `conda`
virtual environment `Aider` containing

    - Python 3 and `pip`,
    - Ollama,
    - Aider, and
    - Shell scripts to manage the Ollama server.

This script will automatically detect whether an NVIDIA GPU
is available and install the GPU-enabled `ollama` package if
it is.

### Operation

1. Enter the virtual environment: `conda activate aider`. On most
Linux shells your shell prompt will change to remind you which environment
you are in.

2. Start the Ollama server: `start_ollama_server.sh`. After the server
starts, all of the pulled models will be listed.

3. Pull some models. I've `whiteboard-interviewed` a few well-known models
and selected a few to test on your own applications. If you have at least 8
GB of RAM, run `small_models.sh`. This takes a fair amount of time but you
only have to do it once. If you have at least 16 GB of RAM, also run
`large_models.sh`. These scripts will also list the installed models.

4. If you forget which models you have, type `list_models.sh`. If there's
a model you want to use that's not in my scripts, type

```
ollama pull <name of model>
```

In theory you don't need to do this; if you `ollama run` a model that
hasn't been downloaded, `ollama` will download it, but it's better to
download models up front rather than interrupt your workflow later.

5. You can now interact with the models directly. Type

```
ollama run <name of model>.
```

6. Start Aider: `aider`.

7. Stopping the Ollama server: `stop_ollama_server.sh`.
