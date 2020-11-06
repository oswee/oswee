#!/bin/sh
SESSION=Prime
# set -- $(stty size) # $1 = rows $2 = columns

if ! tmux has-session -t ="$SESSION" 2>/dev/null; then

  tmux new -s "$SESSION" -n 'Code' -d -x "$(tput cols)" -y "$(tput lines)"
  tmux new-window -t $SESSION:2 -n 'Shell'
  tmux new-window -t $SESSION:3 -n 'Wss'

  tmux select-window -t $SESSION:1
  tmux send-keys 'vim -S workspace.vim' Enter
  tmux split-window -h -p 30
  tmux send-keys 'ibazel run //apps/front:devserver'
  tmux split-window -v -p 30
  tmux select-pane -t 1

  tmux select-window -t $SESSION:2
  tmux split-window -h
  tmux select-pane -t 1

  tmux select-window -t $SESSION:3
  tmux send-keys 'bazel run //api/wss'

  tmux select-window -t $SESSION:1
fi

tmux attach -t "$SESSION"
