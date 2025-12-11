# shellcheck disable=SC2148
# Include ssh oh-my-zsh plugin
source "${HOME}/.oh-my-zsh/plugins/ssh/ssh.plugin.zsh"

# Configuration variables
# Define ssh keys directory
DEFAULT_SSH_KEYS_BASE_DIR="${HOME}/.ssh"
: "${SSH_KEYS_BASE_DIR:=$DEFAULT_SSH_KEYS_BASE_DIR}"
# Define ssh key base name
: "${SSH_KEY_BASE_NAME:=id_rsa}"

# Pipe my public key to my pasteboard.
alias pubkey='more ${SSH_KEYS_BASE_DIR}/${SSH_KEY_BASE_NAME}.pub | xclip -selection clipboard | echo "=> Public key copied to pasteboard."'

# Pipe my private key to my pasteboard.
alias prikey='more ${SSH_KEYS_BASE_DIR}/${SSH_KEY_BASE_NAME} | xclip -selection clipboard | echo "=> Private key copied to pasteboard."'
