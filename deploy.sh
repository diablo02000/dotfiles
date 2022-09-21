#!/usr/bin/env bash

# Init ssh key full path with default value.
DOTFILES_SSH_KEY_FULL_PATH="${HOME}/.ssh/id_rsa"

# Define Vim directory path
declare -r DOTFILES_VIM_CONFIG_DIR="${HOME}/.vim"
declare -r DOTFILES_VIM_AUTOLOAD_DIR="${DOTFILES_VIM_CONFIG_DIR}/autoload"

# Output message to user console.
function output(){
  local message="${1}"
  printf "%b\n" "${message}"
}

# Load .env file if exists.
if [[ -f .env ]];
then
  # Export variable from env file.
  export "$(xargs < .env)"
else
  # Validate path to ssh key
  read -rp "What is the full Path to your SSH key? [${DOTFILES_SSH_KEY_FULL_PATH}] "  user_answer
  if [[ ${user_answer} != "" ]];
  then
    readonly DOTFILES_SSH_KEY_FULL_PATH="${user_answer}"
  fi

  # Save user answer to env file
  readarray -t shell_var < <(set -o posix ; set)
  for var in "${shell_var[@]}";
  do
    if [[ ${var} =~ 'DOTFILES_' ]];
    then
      echo "DOTFILES_SSH_KEY_FULL_PATH='${DOTFILES_SSH_KEY_FULL_PATH}'" > .env
    fi
  done
fi

###
# Configure Vim
###
# Install vim-plug (Required for plugin installation)
if [[ ! -f "${DOTFILES_VIM_AUTOLOAD_DIR}/plug.vim" ]];
then
  output "Install vim-plug."
  curl -fLo "${DOTFILES_VIM_AUTOLOAD_DIR}/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

# Deploy vim user configuration
output "Deploy Vim user configuration file."
cp -u .vimrc "${HOME}/.vimrc"
cp -u .vim/* "${DOTFILES_VIM_CONFIG_DIR}/"

# Install vim plugins
vim_plugins_file_timestamp="$(date -r "${DOTFILES_VIM_CONFIG_DIR}/plugins.vim" +%s)"
modify_timestamp_limit="$(date -d 'now - 2 minutes' +%s)"

if [[ $vim_plugins_file_timestamp -ge $modify_timestamp_limit ]];
then
  output "Install vim plugins."
  vim +PlugInstall +qall
fi

###
# Configure tmux
###
# Deploy tmux configuration
output "Deploy tmux configuration."
cp -u .tmux.conf "${HOME}/.tmux.conf"

###
# Configure curl
###
# Deploy curl output template
output "Deploy curl user configuration."
cp -ru .curl "${HOME}/.curl"

###
# Configure shell
###
output "Deploy custom shell configuration."
cp -ru .functions "${HOME}/"
envsubst < .aliases > "${HOME}/.aliases"

# Load specific file for Mac OS
if [[ $OSTYPE == 'darwin'* ]];
then
    cp .bindkeys_macos "${HOME}/.bindkeys_macos"
fi

# add shell custom file base on shell
case ${SHELL} in
  *zsh)
    cp .zshrc_custom "${HOME}/.zshrc_custom"
    output "To enable zshrc_custom file to need to add the following command in your ~/.zshrc:\n\tsource ${HOME}/.zshrc_custom"
    ;;
  *)
    output "Shell ${SHELL} not handle yet."
    ;;
esac
