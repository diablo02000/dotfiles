# SSH Diablo02000 Plugin for Oh My Zsh

A custom Oh My Zsh plugin to manage SSH keys, based on the default ssh plugin. It adds convenient aliases for copying SSH keys to the clipboard.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installation](#installation)
- [Requirements](#requirements)
- [Features](#features)
  - [Aliases](#aliases)
- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
- [Usage Examples](#usage-examples)
  - [Aliases](#aliases-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

Add ssh-diablo02000 to your Oh My Zsh plugins in ~/.zshrc:

```zsh
plugins=(... ssh-diablo02000)
```

## Requirements

- xclip – Required for copying keys to the clipboard.

## Features

### Aliases

|Alias|Description|
|---|---|
|pubkey|Copy the public SSH key to the clipboard|
|privkey|Copy the private SSH key to the clipboard|

## Configuration

### Environment Variables

|Variable|Description|Default Value|
|---|---|---|
|SSH_KEYS_BASE_DIR|Sets the base directory for SSH keys.|${HOME}/.ssh|
|SSH_KEY_BASE_NAME|Sets the base name for SSH key files (e.g: id_rsa, id_ed25519).|id_rsa|

## Usage Examples

### Aliases

```zsh
# Copy public key to clipboard
pubkey

# Copy private key to clipboard
privkey
```
