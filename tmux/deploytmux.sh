#!/bin/bash

cp .tmux.conf ~/.tmux.conf
cp .tmux.conf.local ~/.tmux.conf.local

tmux source-file ~/.tmux.conf