# Terragrunt Plugin for Oh My Zsh

A plugin for Terragrunt, a thin wrapper for Terraform that provides extra tools for keeping your configurations DRY,
working with multiple Terraform modules, and managing remote state. This plugin adds convenient aliases for common Terragrunt and Terraform commands.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installation](#installation)
- [Requirements](#requirements)
- [Features](#features)
  - [Aliases](#aliases)
- [Usage Examples](#usage-examples)
  - [Aliases Examples](#aliases-examples)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

Add terragrunt to your Oh My Zsh plugins in ~/.zshrc:

```zsh
plugins=(... terragrunt)
```

## Requirements

- Terragrunt – Must be installed and available in your PATH.

## Features

### Aliases

|Alias|Command|Description|
|---|---|---|
|tg|terragrunt|Run Terragrunt commands|
|tga|terragrunt apply|Apply Terraform changes|
|tgc|terraform console|Open Terraform console|
|tgd|terraform destroy|Destroy Terraform-managed infrastructure|
|tgf|terraform fmt|Format Terraform configuration files|
|tgi|terraform init|Initialize Terraform configuration|
|tgo|terraform output|Show Terraform outputs|
|tgp|terraform plan|Generate and show execution plan|
|tgv|terraform validate|Validate Terraform configuration|
|tgs|terraform state|Advanced state management|
|tgsh|terraform show|Show Terraform state or plan|

## Usage Examples

### Aliases Examples

```zsh
# Initialize Terragrunt/Terraform
tgi

# Plan changes
tgp

# Apply changes
tga

# Validate configuration
tgv

# Format configuration files
tgf

```
