# jq plugin for Oh My Zsh

A **Zsh plugin** to manage JSON content using `jq`, `fzf`, and `gron`.
Leverages **mise** for tool management and provides a seamless, interactive way to navigate your filesystem.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [✨ Features](#-features)
- [📦 Installation](#-installation)
- [🔧 Requirements](#-requirements)
- [🚀 Usage](#-usage)
  - [Aliases](#aliases)
- [🎯 Examples](#-examples)
  - [1. URL Encoding](#1-url-encoding)
  - [2. JSON Validation](#2-json-validation)
  - [3. JSON Key Path Exploration](#3-json-key-path-exploration)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ✨ Features

- **URL Encoding**: Encode URLs and copy them to the clipboard.
- **JSON Validation**: Validate JSON files for syntax errors.
- **JSON Key Path Exploration**: Interactively explore and select absolute key paths in JSON files using `gron` and `fzf`.

## 📦 Installation

1. Clone this repository or copy the plugin files to your oh-my-zsh custom plugins directory:

   ```bash
   git clone git@github.com:diablo02000/dotfiles.git /tmp && \
   cp -r /tmp/dotfiles/oh-my-zsh/custom/plugins/jq ~/.oh-my-zsh/custom/plugins/jq
   ```

2. Add the plugin to your .zshrc:

   ```zsh
   plugins=(... jq)
   ```

3. Source your .zshrc to activate the plugin:

   ```bash
    source ~/.zshrc
    ```

## 🔧 Requirements

- **oh-my-zsh**: This plugin is designed for oh-my-zsh.
- **mise** (for managing `jq`, `fzf`, and `gron`)
- **Tools**:
  - [`jq`](https://github.com/jqlang/jq)
  - [`fzf`](https://github.com/junegunn/fzf)
  - [`gron`](https://github.com/tomnomnom/gron)

## 🚀 Usage

### Aliases

|Alias|Command|Description|
|---|---|---|
|urlencode|`urlencode "<url>"`|Encode a URL and copy it to the clipboard.|
|jqv|`jqv <file.json>`|Validate a JSON file for syntax errors.|
|jqex|`jqex <file.json>`|Interactively explore and select absolute key paths in a JSON file.|

## 🎯 Examples

### 1. URL Encoding

```zsh
urlencode "https://example.com/path with spaces"
```

Encodes the provided URL and copies it to the clipboard.

### 2. JSON Validation

```zsh
jqv file.json
```

Validates the JSON file for syntax errors.

### 3. JSON Key Path Exploration

```zsh
jqex file.json
```

Flattens the JSON file and allows you to interactively select absolute key paths using fzf.
