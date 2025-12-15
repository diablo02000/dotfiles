# CURL plugin for Oh My Zsh

A **Zsh plugin** to deploy powerful and convenient aliases for the `curl` command.
Designed for efficiency, debugging, and performance measurement, this plugin provides shortcuts for common `curl` use cases,
including silent requests, JSON headers, timing metrics, and bandwidth measurement.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [✨ Features](#-features)
- [📦 Installation](#-installation)
- [🔧 Requirements](#-requirements)
- [🚀 Usage](#-usage)
  - [Aliases](#aliases)
- [🎯 Examples](#-examples)
  - [1. Silent cURL with Redirects](#1-silent-curl-with-redirects)
  - [2. JSON Requests](#2-json-requests)
  - [3. Timing Metrics](#3-timing-metrics)
  - [4. Bandwidth Measurement](#4-bandwidth-measurement)
  - [5. Verbose Debugging](#5-verbose-debugging)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ✨ Features

- **Silent cURL with Redirects**: Run `cURL` silently but show errors (`--show-error`).
- **JSON Requests**: Send HTTP requests with `Content-Type: application/json` header.
- **Timing Metrics**: Measure and display timing for each step of the request.
- **Bandwidth Measurement**: Monitor download/upload speed and size.
- **Verbose Debugging**: Enable verbose output for troubleshooting.

## 📦 Installation

1. Clone this repository or copy the plugin files to your oh-my-zsh custom plugins directory:

   ```bash
   git clone git@github.com:diablo02000/dotfiles.git /tmp && \
   cp -r /tmp/dotfiles/oh-my-zsh/custom/plugins/jq ~/.oh-my-zsh/custom/plugins/jq
   ```

2. Add the plugin to your .zshrc:

   ```zsh
   plugins=(... curl)
   ```

3. Source your .zshrc to activate the plugin:

   ```bash
    source ~/.zshrc
    ```

## 🔧 Requirements

- **oh-my-zsh**: This plugin is designed for oh-my-zsh.
- **cURL**: Ensure `cURL` is installed and available in your $PATH.

## 🚀 Usage

### Aliases

|Alias|Command|Description|
|---|---|---|
|cl|`curl -Ls --show-error`|Run cURL silently with redirects and show errors.|
|jcl|`curl -Ls --show-error -H "Content-Type: application/json"`|Send HTTP requests with JSON Content-Type.|
|tcl|`curl -Ls -o /dev/null --show-error -w "${CURL_TIME_TAKEN_TMPL}"`|Measure and display timing metrics for each step of the request.|
|bcl|`curl -Ls -o /dev/null --show-error -w "${CURL_BANDWITH_TMPL}"`|Measure TCP bandwidth (download/upload speed and size).|
|vcl|`curl -Lv`|Run cURL in verbose mode for debugging.|

## 🎯 Examples

### 1. Silent cURL with Redirects

```zsh
cl https://example.com
```

Runs `curl` silently, follows redirects, and shows errors if any occur.

### 2. JSON Requests

```zsh
jcl -d '{"key":"value"}' https://api.example.com
```

Sends a JSON request with the `Content-Type: application/json` header.

### 3. Timing Metrics

```zsh
tcl https://example.com
```

Displays timing metrics for each step of the request (DNS lookup, connection, transfer, etc.).

### 4. Bandwidth Measurement

```zsh
bcl https://example.com
```

Measures and displays download/upload speed and size.

### 5. Verbose Debugging

```zsh
vcl https://example.com
```

Runs `curl` in verbose mode for detailed debugging output.
