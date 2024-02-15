# Development plugin

To use it, add `development` to the  plugins array of your `~/.zshrc` file:

```
plugins=(... development)
```

## Requirements

* [jq](https://jqlang.github.io/jq/manual/)
* [shellcheck](https://github.com/koalaman/shellcheck)
* [git-grab](https://github.com/jmcgarr/git-grab)
* Python

## Aliases

| Alias                  | Description                              |
|------------------------|------------------------------------------|
| `jqv`                  | Check if JSON is valide                  |
| `urlencode`            | Encode url                               |
| `scheck`               | Run shellcheck                           |
| `shfmt`                | Format shell script                      |
| `ftrailing_whitespace` | Remove trailing whitespace in a document |

## Functions

| Function    | Description                                  |
|-------------|----------------------------------------------|
| `gi`        | Use gitignore api to generate gitignore file |
| `b64encode` | Encore string in base64                      |
| `b64decode` | Encore string in base64                      |
| `ggb`       | Run git-grab and switch to cloned folder     |
