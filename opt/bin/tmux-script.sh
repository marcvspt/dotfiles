#!/bin/bash

tiempo=0.5

tmux new-session -d -t "EvilTwin" && sleep $tiempo
tmux rename-window "flush" && tmux split-window -h && tmux select-pane -t 1
tmux send-keys "iptables --flush" C-m && sleep $tiempo
tmux send-keys "iptables --table nat --flush" C-m && sleep $tiempo
tmux send-keys "iptables --delete-chain" C-m && sleep $tiempo
tmux send-keys "iptables --table nat --delete-chain" C-m && sleep $tiempo
#--------------------------------------------------------------------------
tmux select-pane -t 2 && tmux send-keys "iptables -L" C-m && sleep $tiempo
#--------------------------------------------------------------------------
tmux new-window -t EvilTwin:2 -n "passwd" && sleep $tiempo && tmux send-keys "cat /etc/passwd" C-m && sleep $tiempo
tmux select-window -t 1
