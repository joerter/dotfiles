#!/usr/bin/env bash

session="dina"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'core server'
tmux send-keys -t $session:$window 'cdc enTouch-core' C-m

window=1
tmux new-window -t $session:$window -n 'core vim'
tmux send-keys -t $session:$window 'cdc enTouch-core && nvm use node' C-m

window=2
tmux new-window -t $session:$window -n 'hub server'
tmux send-keys -t $session:$window 'cdc hub' C-m

window=3
tmux new-window -t $session:$window -n 'hub vim'
tmux send-keys -t $session:$window 'cdc hub && nvm use node' C-m

window=4
tmux new-window -t $session:$window -n 'buh server'
tmux send-keys -t $session:$window 'cdc buh && nvm use' C-m

window=5
tmux new-window -t $session:$window -n 'buh vim'
tmux send-keys -t $session:$window 'cdc buh && nvm use node' C-m

tmux attach-session -t $session
