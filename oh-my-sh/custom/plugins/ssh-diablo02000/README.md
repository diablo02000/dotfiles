# SSH diablo02000 plugin

Base on `ssh` oh-my-zsh plugins, this plugin add custom aliases.

To use it, add `ssh-diablo02000` to the  plugins array of your `~/.zshrc` file:

```
plugins=(... ssh-diablo02000)
```

## Requirements

* xclip

## Aliases

| Alias | Description                               |
|-------|-------------------------------------------|
| `pubkey`   | Copy public key in system pasteboard  |
| `privkey`  | Copy private key in system pastboard |

## Configuration Variables

| Variable             | Description                                              |
|----------------------|----------------------------------------------------------|
| `SSH_KEYS_BASE_DIR`  | Sets path to ssh key directory. (default: ${HOME}/.ssh)  |
| `SSH_KEY_BASE_NAME`  | Sets ssh key base name. (default: id_rsa)                |
