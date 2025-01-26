#!/bin/bash

mkdir -p ~/.backupneo
mv ~/.config/neofetch/config.conf ~/.backupneo/config.conf

mkdir -p ~/.config/neofetch
cp config.conf ~/.config/neofetch/config.conf
