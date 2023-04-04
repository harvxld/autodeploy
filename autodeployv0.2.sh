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
}

#Fonction pour installer les outils vmware
vmware(){
    echo
    echo ---- Installing open-vm-tools ----    
    echo
    sudo apt install open-vm-tools
}

#Vérification des arguments
while getopts 'vha' OPTION; do
  case "$OPTION" in
    v)
      auto; echo; echo "Deployment finished."; echo "Please logout and login back to your account to switch to Z Shell."; exit;
      vmware;
      ;;
    h)
      echo
      echo "script usage: $(basename $0) [-a] [-h] [-v]"
      echo
      echo "-a: automatic deployment"
      echo "-h: display help"
      echo "-v: automatic deployment + open-vm-tools"
      echo "start script without arguments to show main menu"
      echo
      exit
      ;;
    a)
      auto; echo; echo "Deployment finished."; echo "Please logout and login back to your account to switch to Z Shell."; exit;
      ;;
    ?)
      echo "script usage: $(basename $0) [-a] [-h] [-v]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

# Afficher un menu dans une boucle
while true; do
clear
echo "1. Automatic deployment"
echo "2. Update & upgrade packages"
echo "3. Install Zsh"
echo "4. Edit ~/.zshrc"
echo "5. Install packages"
echo "6. Quit"
echo
read -p "Choose a number: " num
    case $num in 
        [1] ) auto; read -p "Press key to continue:"; break;
            ;;
        [2] ) up; read -p "Press key to continue:";
            ;;
        [3] ) install_zsh; read -p "Press key to continue:";
            ;;
        [4] ) sudo nano ~/.zshrc;
            ;;
        [5] ) sudo apt install git ffmpeg bat dmidecode;
            read -p "Press key to continue:";
            ;;
        [6] )clear;
            break;;
        * ) echo invalid response; read -p "";
    esac
    done
echo "Please logout and login back to your account to switch to Z Shell."