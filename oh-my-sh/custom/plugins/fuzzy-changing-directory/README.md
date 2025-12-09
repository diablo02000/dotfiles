# Fuzzy Directory Changer plugin for Oh My Zsh

A **Zsh plugin** for quickly changing directories using `fd`, `fzf`, and `eza`.
Leverages **mise** for tool management and provides a seamless, interactive way to navigate your filesystem.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [✨ Features](#-features)
- [📦 Installation](#-installation)
- [🔧 Requirements](#-requirements)
- [🚀 Usage](#-usage)
  - [Aliases](#aliases)
- [🎯 Examples](#-examples)
  - [1. Change directory to any repository in `~/Gits/` folder](#1-change-directory-to-any-repository-in-gits-folder)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ✨ Features

- **Fuzzy directory search**: Use `fd` and `fzf` to find and select directories interactively.
- **Preview with `eza`**: Get a tree-like preview of directories before selecting.
- **Git repository support**: Built-in alias (`cdg`) to jump to Git repos in `~/Gits`.
- **Robust error handling**: Validates tool availability and directory selection.
- **Mise integration**: Uses absolute paths to mise shims for reliability.

## 📦 Installation

1. Clone this repository or copy the plugin files to your oh-my-zsh custom plugins directory:

   ```bash
   git clone git@github.com:diablo02000/dotfiles.git /tmp && \
   cp -r /tmp/dotfiles/oh-my-zsh/custom/plugins/working-helper ~/.oh-my-zsh/custom/plugins/workspace-manager
   ```

2. Add the plugin to your .zshrc:

   ```zsh
   plugins=(... fuzzy-changing-directory)
   ```

3. Source your .zshrc to activate the plugin:

   ```bash
    source ~/.zshrc
    ```

## 🔧 Requirements

- **oh-my-zsh**: This plugin is designed for oh-my-zsh.
- **mise** (for managing `fd`, `fzf`, and `eza`)
- **Tools**:
  - [`fd`](https://github.com/sharkdp/fd)
  - [`fzf`](https://github.com/junegunn/fzf)
  - [`eza`](https://github.com/eza-community/eza)

## 🚀 Usage

### Aliases

|Alias|Command|Description|
|---|---|---|
|cdg|`_fuzzy_fd "${HOME}/Gits" ".git$"`|Change to a Git repository in ~/Gits.|

## 🎯 Examples

### 1. Change directory to any repository in `~/Gits/` folder

```zsh
cdg
```

