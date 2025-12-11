# Development Plugin for Oh My Zsh

A collection of aliases and functions to streamline development workflows.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installation](#installation)
- [Requirements](#requirements)
- [Features](#features)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Usage Examples](#usage-examples)
  - [Aliases Examples](#aliases-examples)
  - [Functions Examples](#functions-examples)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

Add development to your Oh My Zsh plugins in ~/.zshrc:

```zsh
plugins=(... development)
```

## Requirements

Ensure the following tools are installed:

- jq – JSON processor
- shellcheck – Shell script linter
- git-grab – Clone GitHub repositories
- Python – Required for some functions

## Features

### Aliases

|Alias|Description|
|---|---|
|jqv|Validate JSON input|
|urlencode|URL-encode a string|
|scheck|Run shellcheck on a shell script|
|shfmt|Format shell scripts|
|ftrailing_whitespace|Remove trailing whitespace from files|

### Functions

|Function|Description|
|---|---|
|gi|Generate .gitignore files using [gitignore.io](https://www.toptal.com/developers/gitignore)|
|b64encode|Base64-encode a string|
|b64decode|Base64-decode a string|
|ggb|Clone a GitHub repository and cd into its directory|

## Usage Examples

### Aliases Examples

```zsh
# Validate JSON
echo '{"key": "value"}' | jqv

# URL-encode a string
urlencode "https://example.com/hello world"

# Lint a shell script
scheck myscript.sh

# Format a shell script
shfmt -w myscript.sh

# Remove trailing whitespace
ftrailing_whitespace myfile.txt
```

### Functions Examples

```zsh
# Generate a .gitignore file
gi python,node

# Base64-encode/decode
b64encode "hello world"
b64decode "aGVsbG8gd29ybGQ="

# Clone and enter a GitHub repo
ggb mistralai/mistral-src
```
