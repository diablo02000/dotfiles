# Dotfiles

Set of several local tools configuration files (Zsh, Git, Tmux ...).

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [1. Install `mise`](#1-install-mise)
  - [2. Clone the Repository](#2-clone-the-repository)
  - [3. Install Tools with mise](#3-install-tools-with-mise)
- [Usage](#usage)
  - [Deploying Configurations](#deploying-configurations)
- [Available Modules](#available-modules)
- [Examples](#examples)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Prerequisites

- **mise**: To manage tools and versions. See [Installation](#installation) for setup instructions.

## Installation

### 1. Install `mise`

`mise` is used to manage all required tools and versions. Install it using the following command:

```bash
curl -sL https://mise.run   sh
```

After installation, restart your shell or run:

```bash
source "\$HOME/.local/share/mise/mise.sh"
```

For more informations, check the official [mise](https://mise.jdx.dev/getting-started.html) site.

### 2. Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 3. Install Tools with mise

Run the following command to install all tools and versions specified in .mise.toml:

```bash
mise install
```

## Usage

```zsh
Usage: deploy.sh [-h] [-m MODULES] [-z ZSH_PLUGINS]

Options:
  -h    Print this help message
  -m    Comma-separated list of modules to deploy (e.g., 'mise,zsh-plugins')
  -z    Comma-separated list of Zsh plugins to deploy (e.g., 'plugin1,plugin2')
```

### Deploying Configurations

Use the deploy.sh script to deploy configurations for specific modules.

```bash
./deploy.sh -m "module1,module2"
```

## Available Modules

The following modules are available for deployment:

|Module|Description|
|---|---|
|mise|Deploys configuration files for [mise](https://mise.jdx.dev/).|
|zsh-plugins|Deploy Zsh custom plugins|

## Examples

1. Deloy mise configuration

   ```zsh
   bash ./deploy.sh -m mise
   ```

2. Deploy All Zsh custom plugins

   ```zsh
   bash ./deploy.sh -m zsh-plugins
   ```

3. Deploy several Zsh custom plugins

   ```zsh
   bash ./deploy.sh -m zsh-plugins -z fuzzy-changing-directory,workdir-helper
   ```
