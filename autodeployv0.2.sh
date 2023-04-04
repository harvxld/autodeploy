#!/bin/bash

install_zsh(){
    echo
    echo '---- Installing ZSH ----'
    echo
    sudo apt -y install zsh  # Installe Zsh via apt
    touch ~/.zshrc.   # Création du fichier d'alias de Zsh
    chsh -s $(which zsh)
    # Demande à l'utilisateur s'il veut modifier le fichier d'alias
    while true; do
    read -p "Do you want to edit aliases ? (~/.zshrc) y/n " yn
    case $yn in 
        [yY] ) sudo nano ~/.zshrc;
            break;;
        [nN] ) echo ;
            break;;
        * ) echo invalid response;
    esac

    done
}

up(){
    echo
    echo ---- Updating package list ----  # Juste pour l'apparence
    echo
    sudo apt update           # Mettre à jour les répertoires de paquets

    echo
    echo ---- Upgrading packages ----    
    echo
    sudo apt -y upgrade       # Mettre à jour les paquets installés
    sudo apt -y autoremove    # Supprimer les dépendances inutilisées
}

#Fonction pour installer automatiquement
auto(){
    up
    if [[ "$SHELL" ==  *bash* ]]    #Check si le shell est /bin/bash
    then
        while true; do
            read -p "- Do you want to install zsh ? y/n " yn    #Demande à l'utilisateur s'il veut installer Zsh
            case $yn in 
                [yY] ) install_zsh; #Appel de la fonction install_zsh
                    break;;
                [nN] ) echo ;
                    break;;
                * ) echo invalid response;
        esac

        done
    fi
    sudo apt install git ffmpeg bat
    echo; echo "Deployment finished."; echo "Please logout and login back to your account to switch to Z Shell."
}

#Fonction pour installer les outils vmware
vmware(){
    echo
    echo ---- Installing open-vm-tools ----    
    echo
    sudo apt install open-vm-tools
}

#Vérification des arguments
while getopts 'vhazpc:' OPTION; do
  case "$OPTION" in
    v)
      vmware;
      ;;
    h)
      echo
      echo "script usage: $(basename $0) [-a] [-h] [-v]"
      echo
      echo "-a: automatic deployment"
      echo "-h: display help"
      echo "-v: install open-vm-tools"
      echo "-c: install additional packages [Usage : ./autodeploy.sh -c foo bar]"
      echo "-z: install zsh"
      echo "-p: only install default packages (git, ffmpeg, bat)"
      echo
      ;;
    a)
      auto;
      ;;
    z)
      install_zsh;
      ;;
    p)
      sudo apt install git ffmpeg bat
      ;;
    c)
      pkgs="$OPTARG"
      sudo apt install $pkgs
      ;;
    ?)
      echo "script usage: $(basename $0) [-a] [-h] [-v]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"