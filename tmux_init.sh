#!/bin/bash

# Start tmux and create nvim config session
tmux new-session -d -s nvim-config -n "nvim"

# Create windows and navigate to config folder
tmux send-keys -t nvim-config:1 'cd ~/.config/nvim/' C-m
tmux send-keys -t nvim-config:1 'clear' C-m
tmux send-keys -t nvim-config:1 'nvim .' C-m
tmux new-window -t nvim-config:2 -n 'console'
tmux send-keys -t nvim-config:2 'cd ~/.config/nvim/' C-m
tmux send-keys -t nvim-config:2 'clear' C-m

# Create coding session
tmux new-session -d -s coding -n "nvim"

# Create windows and navigate to coding folder
tmux send-keys -t coding:1 'cd ~/Documents/coding/' C-m
tmux send-keys -t coding:1 'clear' C-m
tmux send-keys -t coding:1 'nvim .' C-m
tmux new-window -t coding:2 -n 'console'
tmux send-keys -t coding:2 'cd ~/Documents/coding/' C-m
tmux send-keys -t coding:2 'clear' C-m

tmux attach -t coding:1
