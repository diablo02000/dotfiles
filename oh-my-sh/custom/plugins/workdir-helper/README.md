# Working directory manager plugin for Oh My Zsh

A plugin to quickly create, manage, archive, and restore workspace directories with ease.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [✨ Features](#-features)
- [📦 Installation](#-installation)
- [🔧 Requirements](#-requirements)
- [🚀 Usage](#-usage)
  - [Aliases](#aliases)
- [🔧 Configuration](#-configuration)
  - [Customize Workspace Root Directory](#customize-workspace-root-directory)
- [🎯 Examples](#-examples)
  - [1. Create and Navigate to Today's Workspace](#1-create-and-navigate-to-todays-workspace)
  - [2. Select and Navigate to an Existing Workspace](#2-select-and-navigate-to-an-existing-workspace)
  - [3. Archive a Workspace](#3-archive-a-workspace)
  - [4. Restore an Archived Workspace](#4-restore-an-archived-workspace)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ✨ Features

- **Create Workspaces**: Automatically generate a workspace directory with the current date.
- **Interactive Selection**: Use `fzf` to select workspaces or archives interactively.
- **Archive Workspaces**: Compress and archive workspaces as `.tar.xz` files.
- **Restore Archives**: Extract and restore archived workspaces.
- **Change Directory**: Quickly navigate to today's workspace or select from existing ones.

## 📦 Installation

1. Clone this repository or copy the plugin files to your oh-my-zsh custom plugins directory:

   ```bash
   git clone git@github.com:diablo02000/dotfiles.git /tmp && \
   cp -r /tmp/dotfiles/oh-my-zsh/custom/plugins/working-helper ~/.oh-my-zsh/custom/plugins/workspace-manager
   ```

2. Add the plugin to your .zshrc:

   ```zsh
   plugins=(... workspace-dir)
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
|mkworkdir|createWorkingSpace|Create a new workspace for today.|
|cdworkdir|changeDirectoryToWorkingDir 1|Change to today's workspace.|
|fdworkdir|changeDirectoryToWorkingDir 0|Interactively select and change to a workspace.|
|arworkdir|archiveWorkingDirectory|Archive a selected workspace.|
|reworkdir|restoreArchivedWorkingDirectory|Restore a selected archived workspace.|

## 🔧 Configuration

### Customize Workspace Root Directory

By default, workspaces are created in ~/workspaces. To change this, set the WORKSPACE_ROOT_DIR environment variable in your .zshrc:

```zsh
export WORKSPACE_ROOT_DIR="\${HOME}/my-custom-workspaces"
```

## 🎯 Examples

### 1. Create and Navigate to Today's Workspace

```zsh
cdworkdir
```

### 2. Select and Navigate to an Existing Workspace

```zsh
fdworkdir
```

### 3. Archive a Workspace

```zsh
arworkdir
```

- Select the workspace you want to archive.

### 4. Restore an Archived Workspace

```zsh
reworkdir
```

- Select the archive you want to restore.

