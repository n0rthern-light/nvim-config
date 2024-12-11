# A Complete IDE replacement NeoVim configuration

<img width="1017" alt="preview" src="https://github.com/n0rthern-light/nvim-config/assets/45363185/99a67afd-f55e-4ccb-bedc-94451ed68f8b">

### How to start

Copy `init.lua` to:
```
~/.config/nvim/init.lua
```

Call to install required plugins:
```
:PackerInstall
```

Call to update everything:
```
:PackerUpdate
:MasonUpdate
:TSUpdate
```

Good tmux config to manage nvim instances:
```zsh
set -g default-terminal "screen-256color"
set -g mouse on
set -g prefix C-a

unbind r
bind r source-file ~/.tmux.conf

unbind C-b
bind-key C-a send-prefix

unbind %
bind | split-window -h

unbind '"'
bind - split-window -v

bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
bind -r H resize-pane -L 5

unbind j
unbind k
unbind l
unbind h

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -r m resize-pane -Z

set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'christoomey/vim-tmux-navigator'

run '~/.tmux/plugins/tpm/tpm'

set -g status-style "bg=#375bc7"
```
