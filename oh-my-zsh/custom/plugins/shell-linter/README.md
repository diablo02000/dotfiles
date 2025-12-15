# Shell Linter plugin for Oh My Zsh

A **Zsh plugin** to lint Shell script content using `shellcheck` and `shfmt`.
Leverages **mise** for tool management and provides a seamless, interactive way to navigate your filesystem.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [✨ Features](#-features)
- [📦 Installation](#-installation)
- [🔧 Requirements](#-requirements)
- [🚀 Usage](#-usage)
  - [Aliases](#aliases)
- [🎯 Examples](#-examples)
  - [1. Analyse script](#1-analyse-script)
  - [2. Formatte script](#2-formatte-script)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ✨ Features

- **shellcheck**: A shell script static analysis tool.
- **shfmt**: A shell parser, formatter, and interpreter.

## 📦 Installation

1. Clone this repository or copy the plugin files to your oh-my-zsh custom plugins directory:

   ```bash
   git clone git@github.com:diablo02000/dotfiles.git /tmp && \
   cp -r /tmp/dotfiles/oh-my-zsh/custom/plugins/jq ~/.oh-my-zsh/custom/plugins/jq
   ```

2. Add the plugin to your .zshrc:

   ```zsh
   plugins=(... shell-linter)
   ```

3. Source your .zshrc to activate the plugin:

   ```bash
    source ~/.zshrc
    ```

## 🔧 Requirements

- **oh-my-zsh**: This plugin is designed for oh-my-zsh.
- **mise** (for managing `shellcheck` and `shfmt`)
- **Tools**:
  - [`shellcheck`](https://github.com/koalaman/shellcheck)
  - [`shfmt`](https://github.com/mvdan/sh)

## 🚀 Usage

### Aliases

|Alias|Command|Description|
|---|---|---|
|shchk|`shchk <file.sh>`|Analyse script and suggests fixes for common errors and potential improvements.|
|shfmt|`shfmt <file.sh>`|Formatte script.|

## 🎯 Examples

### 1. Analyse script

```zsh
shchk script.sh
```

### 2. Formatte script

```zsh
shfmt file.sh
```
