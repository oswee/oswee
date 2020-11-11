#!/bin/sh
SESSION=Prime

if ! tmux has-session -t ="$SESSION" 2>/dev/null; then

  tmux new -s "$SESSION" -n 'Code' -d -x "$(tput cols)" -y "$(tput lines)"
  tmux new-window -t $SESSION:2 -n 'Front'
  tmux new-window -t $SESSION:3 -n 'Shell'
  tmux new-window -t $SESSION:4 -n 'Wss'

  tmux select-window -t $SESSION:1
  tmux send-keys 'vim -S workspace.vim' Enter
  tmux split-window -h -p 30
  tmux send-keys 'cd src' Enter
  tmux send-keys 'ibazel run //platform/web:devserver'
  tmux split-window -v -p 30
  tmux select-pane -t 1

  tmux select-window -t $SESSION:2
  tmux send-keys 'cd ~/code/github.com/dzintars/front && vim .' Enter

  tmux select-window -t $SESSION:3
  tmux split-window -h
  tmux select-pane -t 1

  tmux select-window -t $SESSION:4
  tmux send-keys 'cd src' Enter
  tmux send-keys 'bazel run //oswee/gateway -- -a :9090'

  tmux select-window -t $SESSION:1
fi

tmux attach -t "$SESSION"

