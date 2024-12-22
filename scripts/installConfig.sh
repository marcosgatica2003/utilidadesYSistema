#!/bin/bash

RAIZ_REPOSITORIO=../
CONFIG_DIR=/home/$USER/.config/
USER_HOME=/home/$USER/

echo -e "---------------------------------------------"

cp -r $RAIZ_REPOSITORIO/configuracionesEsenciales/config/* $CONFIG_DIR

cp $RAIZ_REPOSITORIO/configuracionesEsenciales/zshrc $USER_HOME/.zshrc
cp $RAIZ_REPOSITORIO/configuracionesEsenciales/tmux.conf $USER_HOME/.tmux.conf
tmux source-file $USER_HOME/.tmux.conf
mkdir -p $USER_HOME/Wallpapers
cp $RAIZ_REPOSITORIO/configuracionesEsenciales/wallpapers.tar.gz $USER_HOME/Wallpapers
tar xvf $USER_HOME/Wallpapers/wallpapers.tar.gz 
rm $USER_HOME/Wallpapers/wallpapers.tar.gz 

