# Terragrunt Extended Plugin for Oh My Zsh

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

Add terragrunti-extended to your Oh My Zsh plugins in ~/.zshrc:

```zsh
plugins=(... terragrunt-extended)
```

## Requirements

- Terragrunt – Must be installed and available in your PATH.

## Features

### Aliases

|Alias|Command|Description|
|---|---|---|
|tg|terragrunt|Run Terragrunt command|
|tga|terragrunt apply|Apply HCL files|
|tgc|terragrunt console|Start Terragrunt console|
|tgd|terragrunt destroy|Destroy resources defined in HCL file|
|tgf|terragrunt hclfmt|Format HCL file|
|tgi|terragrunt init|Initialize Terragrunt project|
|tgo|terragrunt stack output|Retrieve and interact with outputs|
|tgp|terragrunt plan|Show planned changes|
|tgpr|terragrunt providers|Show the providers required for this configuration|
|tgr|terragrunt refresh|Update the state to match remote systems|
|tgs|terragrunt state|Interact with Terragrunt state|
|tgsc|terragrunt stack clean|Remove .terragrunt-stack directory|
|tgsh|terragrunt show|Show current Terragrunt state or plan|
|tgv|terragrunt hcl validate|Validate HCL files|

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
