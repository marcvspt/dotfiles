#!/usr/bin/bash

tiempo=0.5

/usr/bin/tmux new-session -d -t "EvilTwin" && /usr/bin/sleep $tiempo
/usr/bin/tmux rename-window "flush" && /usr/bin/tmux split-window -h && /usr/bin/tmux select-pane -t 1
/usr/bin/tmux send-keys "iptables --flush" C-m && /usr/bin/sleep $tiempo
/usr/bin/tmux send-keys "iptables --table nat --flush" C-m && /usr/bin/sleep $tiempo
/usr/bin/tmux send-keys "iptables --delete-chain" C-m && /usr/bin/sleep $tiempo
/usr/bin/tmux send-keys "iptables --table nat --delete-chain" C-m && /usr/bin/sleep $tiempo
#--------------------------------------------------------------------------
/usr/bin/tmux select-pane -t 2 && /usr/bin/tmux send-keys "iptables -L" C-m && /usr/bin/sleep $tiempo
#--------------------------------------------------------------------------
/usr/bin/tmux new-window -t EvilTwin:2 -n "passwd" && /usr/bin/sleep $tiempo && /usr/bin/tmux send-keys "cat /etc/passwd" C-m && /usr/bin/sleep $tiempo
/usr/bin/tmux select-window -t 1
