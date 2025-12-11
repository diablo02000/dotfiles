# Networking Plugin for Oh My Zsh

A collection of aliases for networking tasks, including HTTP requests, IP lookups, and cURL templating.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installation](#installation)
- [Requirements](#requirements)
- [Features](#features)
  - [Aliases](#aliases)
- [Configuration](#configuration)
  - [cURL Templates](#curl-templates)
    - [Tracing Templates](#tracing-templates)
    - [Bandwidth Template](#bandwidth-template)
- [Usage Examples](#usage-examples)
  - [Aliases Examples](#aliases-examples)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

Add networking to your Oh My Zsh plugins in ~/.zshrc:

```zsh
plugins=(... networking)
```

## Requirements

- cURL – Required for HTTP requests and IP lookups.

## Features

### Aliases

|Alias|Description|
|---|---|
|tcurl|Run cURL with tracing and stats output|
|jcurl|Run cURL with Content-Type: application/JSON|
|pubip|Fetch your public IP address|
|privip|Fetch your private IP address|

## Configuration

### cURL Templates

#### Tracing Templates

```text
%{method} %{url} => %{http_code}
time_namelookup:  %{time_namelookup} seconds
time_connect:     %{time_connect} seconds
time_appconnect:  %{time_appconnect} seconds
time_pretransfer: %{time_pretransfer} seconds
time_redirect:    %{time_redirect} seconds
time_starttransfer: %{time_starttransfer} seconds
----------
time_total:       %{time_total} seconds
```

#### Bandwidth Template

```text
%{method} %{url} => %{http_code}
download:         %{speed_download} bytes/sec
download size:    %{size_download} bytes
upload:           %{speed_upload} bytes/sec
upload size:      %{size_upload} bytes
```

## Usage Examples

### Aliases Examples

```zsh
# Run curl with tracing
tcurl https://example.com

# Run curl with JSON content type
jcurl -d '{"key": "value"}' https://api.example.com

# Get public IP
pubip

# Get private IP
privip
```
