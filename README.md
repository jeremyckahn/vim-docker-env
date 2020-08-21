# vim-docker-env

[![Dockerhub Repo](https://img.shields.io/docker/automated/jeremyckahn/vimconf.live)](https://hub.docker.com/repository/docker/jeremyckahn/vimconf.live)

## A lightweight Vim environment powered by Pathogen, vim-plug, and Docker

This repo is an educational tool to be used at [jeremyckahn](https://github.com/jeremyckahn)'s Vimconf.live workshop session. It should work on OS X, Windows, and Linux.

## Installation (please do this before the workshop begins!)

### Step 1: Install the environment

1. [Install Docker](https://docs.docker.com/get-docker/)
2. Clone this Git repo. (`git clone https://github.com/jeremyckahn/vim-docker-env.git`)
3. `cd` into this repo.
4. Run this command at the root of this repo:

On Linux and OS X:

```
docker run -it --rm -v "$(pwd)":/home/vimuser jeremyckahn/vimconf.live:latest
```

On Windows (must be done in Powershell):

```
docker run -it --rm -v ${PWD}:/home/vimuser jeremyckahn/vimconf.live:latest
```

From here you'll be in a Linux-based container environment. The home directory configuration files in this environment are the same as the ones in the Git repo root. Modifying a home directory file in the container will modify the same file in the host environment (and vice-versa).

### Step 2: Install the plugins

Once in the Linux environment, you can boot Vim with `vim`. From here enter `:PlugInstall` to install the plugins that we'll go over in the workshop. Once that process is complete, you can either enter `:Reload` or simply quit Vim and boot it up again for the changes to take effect.

**Note:** To get back into this Vim environment again later, you'll just need to run the `docker run` command from step 1 as you did the first time. You won't need to do step 2 again, as the files installed by that step were placed in the Git repo on your host machine, which persist across Docker container instances.
