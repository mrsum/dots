# Dotfiles

![Dotfiles](image.png)


#### Keymaps:

```bash
# Navigation
<C-t> - create new tab
<Tab>/<S-Tab> - switch tab
<S-V> - split vertical
<S-H> - split horizontal
<S-Up>/<S-Down>/<S-Left>/<S-Right> - move between screens

# LSP
<.> - LSP Finder
<S-O> - LSP Outlines

# GIT
<C-G> - gitui
<C-D> - Diffview
```

#### Install:

```bash
# mac os homebrew packages
- brew install nvim
- brew install tmux
- brew install alacritty

# tmux plugin manager
- $ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Copy:

```bash
cp -r ./config ~/.config
```

Or create symlink

```bash
ln -s ~/path/to/repo/config ~/.config
```

#### Commands:

tmux:

```bash
# keys
# ctrl+a - leader keys

<leader> c    - create new tab
<leader> 0-9  - switch to tab
<leader> |    - split vertical
<leader> "    - split horizontal

# switch to windows
<leader> Up
<leader> Down
<leader> Right
<leader> Left
```

#### Run:

```bash
nvim

```