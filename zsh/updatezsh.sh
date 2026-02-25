#!/bin/bash

mkdir -p ~/.backupzsh
mv ~/.zshrc ~/.backupzsh/.zshrc
mv ~/.alias ~/.backupzsh/.alias
mv ~/.zfunctions ~/.backupzsh/.zfunctions

cp .zshrc ~/.zshrc
cp .alias ~/.alias
cp .zfunctions ~/.zfunctions