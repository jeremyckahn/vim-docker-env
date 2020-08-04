# vim-docker-env

## A bare Vim environment, plus Pathogen, powered by Docker

This is an educational tool to be used at [jeremyckahn](https://github.com/jeremyckahn)'s Vimconf.live workshop session. It should work on OS X, Windows, and Linux.

## How to use

1. If on Windows, [set up WSL 2](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
2. [Install Docker](https://docs.docker.com/get-docker/)
3. If on Windows, enter your WSL 2 environment.
4. Clone this repo.
5. Run this command at the root of this repo:

```
sh boot-vim-env.sh
```

From here you'll be in a Linux-based container environment. The dotfiles in this environment are the same as the ones in the repo root. Modifying the file in the container will modify the file in the host environment (and vice-versa).

## Troubleshooting

### Windows/WSL 2

If you see a message that looks like this: 

```
E: Release file for http://security.ubuntu.com/ubuntu/dists/focal-security/InRelease is not valid yet (invalid for another 2d 12h 59min 21s). Updates for this repository will not be applied.
```

Restart Docker and WSL 2 (or just reboot your machine).
