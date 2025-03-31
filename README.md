# 💤 LazyVim of Rong

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## pre-requisites

1. [git >= 2.19](https://git-scm.com/downloads)
2. [neovim](https://github.com/neovim/neovim), or [neovim-release](https://github.com/neovim/neovim-releases) for linux with gibc 2.17 (not recommended)
3. [lazygit](https://github.com/jesseduffield/lazygit)
4. [curl](https://curl.se/)
5. [fzf](https://github.com/junegunn/fzf)
6. [rg](https://github.com/BurntSushi/ripgrep)
7. [fd](https://github.com/sharkdp/fd)

For windows, you can download the pre-requisites using scoop. curl can be found in the busybox package.

## Installation

For linux or macos, run the following command in your terminal:

```bash
git clone https://github.com/luyiyun/lazyvim.git ~/.config/nvim
```

For windows, run the following command in powershell:

```powershell
git clone https://github.com/luyiyun/lazyvim.git $env:LOCALAPPDATA\nvim
```

## After installation

1. run `:Fitten login` to get FittenCode support.

## TODO Lists

- [ ] python LSP suggestions does not work with scipy.
