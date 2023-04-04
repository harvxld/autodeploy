Automatic deployment of Z Shell and few packages as well as updating system and existing packages.

Only compatible with apt (Ubuntu, Debian..)

# Features

- Automatic apt update && apt upgrade && apt autoremove
- Automatic install of Z Shell
- Easy ~/.zshrc edit
- Installation of open-vm-tools
- Installation of few other packages

# Usage

Start script without arguments to show main menu

autodeploy.sh [-h] [-a] [-v]
| flag | description                          |
|------|--------------------------------------|
| h    | display help                         |
| a    | automatic deployment                 |
| v    | automatic deployment + open-vm-tools |