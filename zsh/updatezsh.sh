#!/bin/bash

mkdir -p ~/.backupzsh
mv ~/.zshrc ~/.backupzsh/.zshrc
mv ~/.alias ~/.backupzsh/.alias

cp .zshrc ~/.zshrc
cp .alias ~/.alias
