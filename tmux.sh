#!/bin/sh
SESSION=Prime

if ! tmux has-session -t ="$SESSION" 2>/dev/null; then

  tmux new -s "$SESSION" -n 'Code' -d -x "$(tput cols)" -y "$(tput lines)"
  tmux new-window -t $SESSION:2 -n 'Front'
  tmux new-window -t $SESSION:3 -n 'Bazel'
  tmux new-window -t $SESSION:4 -n 'Shell'
  tmux new-window -t $SESSION:5 -n 'Wss'
  tmux new-window -t $SESSION:6 -n 'Infra'

  tmux select-window -t $SESSION:1
  tmux send-keys 'vim .' Enter
  tmux split-window -h -p 30
  tmux send-keys 'cd src; clear' Enter
  tmux send-keys 'ibazel run //platform/web:devserver'
  tmux split-window -v -p 30
  tmux select-pane -t 1

  tmux select-window -t $SESSION:2
  tmux send-keys 'cd ~/code/github.com/dzintars/front && vim .' Enter

  tmux select-window -t $SESSION:3
  tmux send-keys 'cd ~/code/github.com/dzintars/bazel && vim .' Enter
  tmux split-window -h -p 30
  tmux send-keys 'cd ~/code/github.com/dzintars/bazel; clear' Enter
  tmux split-window -v -p 30
  tmux send-keys 'cd ~/code/github.com/dzintars/bazel; clear' Enter
  tmux select-pane -t 1

  tmux select-window -t $SESSION:4
  tmux send-keys 'vim' Enter
  tmux split-window -h
  tmux select-pane -t 1

  tmux select-window -t $SESSION:5
  tmux send-keys 'cd src; clear' Enter
  tmux send-keys 'bazel run //oswee/gateway -- -a :9090'

  tmux select-window -t $SESSION:6
  tmux send-keys 'cd ~/code/github.com/dzintars/infra && vim .' Enter
  tmux split-window -h -p 30
  tmux send-keys 'cd ~/code/github.com/dzintars/infra; clear' Enter
  tmux send-keys 'ansible-playbook play/workstation.yml --tags libvirt:setup:config --ask-vault-pass'
  tmux split-window -v -p 30
  tmux send-keys 'cd ~/code/github.com/dzintars/infra; clear' Enter
  tmux send-keys 'ansible-galaxy role init roles/xxx'
  tmux select-pane -t 1

  tmux select-window -t $SESSION:1
fi

tmux attach -t "$SESSION"

