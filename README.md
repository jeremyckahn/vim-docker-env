# vim-docker-env

## A bare Vim environment, plus Pathogen, powered by Docker

This is an educational tool to be used at @jeremyckahn's Vimconf.live workshop session.

## How to use

1. [Install Docker](https://docs.docker.com/get-docker/)
2. Run this command at the root of this repo:

```
sh boot-vim-env.sh
```

From here you'll be in a Linux-based container environment. The dotfiles in this environment are the same as the ones in the repo root. Modifying the file in the container will modify the file in the host environment (and vice-versa).
