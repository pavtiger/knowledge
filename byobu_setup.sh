#!/bin/zsh

byobu new-session -d -s pavtiger

# htop
byobu rename-window -t 0 htop
byobu send-keys "cd" C-m
byobu send-keys "clear" C-m
byobu send-keys "htop" C-m

# nvtop
byobu new-window -n nvtop
byobu send-keys "cd" C-m
byobu send-keys "clear" C-m
byobu send-keys "nvtop" C-m

# docker
byobu new-window -n docker
byobu send-keys "cd" C-m
byobu send-keys "clear" C-m
byobu send-keys "docker ps -a" C-m

# scripts
byobu new-window -n scripts
byobu send-keys "cd" C-m
byobu send-keys "clear" C-m

# master
byobu new-window -n master
byobu send-keys "cd /home/pavtiger/4tb/automated/photogrammetry/supervision-server" C-m
byobu send-keys "clear" C-m

# client
byobu new-window -n client
byobu send-keys "cd /home/pavtiger/4tb/automated/photogrammetry/process-client" C-m
byobu send-keys "clear" C-m

# ls
byobu new-window -n ls
byobu send-keys "cd" C-m
byobu send-keys "clear" C-m

