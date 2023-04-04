Automatic deployment of Z Shell and few packages as well as updating system and existing packages.

Only compatible with apt (Ubuntu, Debian..)

I wrote this script to learn script bash. It's meant to simplify the process of virtual machines deployment.

# Features

- Automatic apt update && apt upgrade && apt autoremove
- Automatic install of Z Shell
- Easy ~/.zshrc edit
- Installation of open-vm-tools
- Installation of [git](https://github.com/), [ffmpeg](https://ffmpeg.org/documentation.html), [bat](https://github.com/sharkdp/bat)

# Usage

autodeploy.sh [-h] [-a] [-v] [-z] [-p] [-c foo bar]

| flag | description                                                   |
|------|---------------------------------------------------------------|
| -h   | display help                                                  |
| -a   | automatic deployment (same as launching with -zp flag)        |
| -v   | install open-vm-tools                                         |
| -z   | install zsh                                                   |
| -p   | install default packages (git, ffmpeg, bat)                   |
| -c   | install additional packages [Usage: autodeploy.sh -c foo bar] |