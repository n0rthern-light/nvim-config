# A Complete IDE replacement NeoVim configuration

<img width="1017" alt="preview" src="https://github.com/n0rthern-light/nvim-config/assets/45363185/99a67afd-f55e-4ccb-bedc-94451ed68f8b">

### How to start

1. Install newest version of `Neovim`. Best to build from source, because the one from apt might be a bit old.
2. Install required dependencies like python, node and npm.
```
sudo apt install -y nodejs npm python3 python3-pip python3-venv
```

3. Clone the repo to `~/.config/nvim`
```
git clone https://github.com/n0rthern-light/nvim-config.git ~/.config/nvim
```

4. Install packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

5. Call to install required plugins:
```
:PackerInstall
```

6. Call to update everything:
```
:PackerUpdate
:MasonUpdate
:TSUpdate
```
7. Install nerdfonts
https://www.nerdfonts.com/font-downloads

### Good tmux config to manage nvim instances
Paste into `~/.tmux.conf`
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

