# Workspace Dir Plugin for Oh My Zsh

A plugin to quickly navigate to daily workspace directories, with support for both direct and interactive (fzf) directory selection.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installation](#installation)
- [Requirements](#requirements)
- [Features](#features)
  - [Aliases](#aliases)
- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
- [Usage Examples](#usage-examples)
  - [Aliases Examples](#aliases-examples)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

Add workspace-dir to your Oh My Zsh plugins in ~/.zshrc:

```zsh
plugins=(... workspace-dir)
```

## Requirements

None

## Features

### Aliases

|Alias|Command|Description|
|---|---|---|
|cdw|cd ${WORKSPACE_ROOT_DIR}/$(date +%F)|Change to today's workspace directory|
|cdrw|cd ${WORKSPACE_ROOT_DIR}/$(date +%F)|Change to a workspace directory using fzf|

## Configuration

### Environment Variables

|Variable|Description|Default Value|
|---|---|---|
|WORKSPACE_ROOT_DIR|Sets the base directory for workspaces|None|

## Usage Examples

### Aliases Examples

```zsh
# Change to today's workspace directory
cdw

# Select and change to a workspace directory using fzf
cdrw
```
