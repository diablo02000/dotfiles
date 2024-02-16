# Networking plugin

To use it, add `networking` to the  plugins array of your `~/.zshrc` file:

```
plugins=(... networking)
```

## Requirements

* curl

## Aliases

| Alias    | Description                                                |
|----------|------------------------------------------------------------|
| `tcurl`  | Run curl command and output stats with tracing templating  |
| `jcurl`  | Run curl command with JSON `Content-Type`                  |
| `pubip`  | Get public IP                                              |
| `privip` | Get private IP                                             |

## Configuration

### Curl templating

#### Tracing templating

```
%{method} %{url} => %{http_code}

time_namelookup:  %{time_namelookup} seconds
time_connect:  %{time_connect} seconds
time_appconnect:  %{time_appconnect} seconds
time_pretransfer:  %{time_pretransfer} seconds
time_redirect:  %{time_redirect} seconds
time_starttransfer:  %{time_starttransfer} seconds
----------
time_total:  %{time_total} seconds
```
