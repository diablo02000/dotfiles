#!/usr/bin/env bash

# Init ssh key full path with default value.
DOTFILE_SSH_KEY_FULL_PATH="${HOME}/.ssh/id_rsa"

# Define Vim directory path
declare -r DOTFILE_VIM_CONFIG_DIR="${HOME}/.vim"
declare -r DOTFILE_VIM_AUTOLOAD_DIR="${DOTFILE_VIM_CONFIG_DIR}/autoload"

# Output message to user console.
function output(){
  local message="${1}"
  printf "%b\n" "${message}"
}

# Load .env file if exists.
if [[ -f .env ]];
then
  source .env
else
  # Validate path to ssh key
  read -rp "What is the full Path to your SSH key? [${DOTFILE_SSH_KEY_FULL_PATH}] "  user_answer
  if [[ ${user_answer} != "" ]];
  then
    readonly DOTFILE_SSH_KEY_FULL_PATH="${user_answer}"
  fi

  # Save user answer to env file
  readarray -t shell_var < <(set -o posix ; set)
  for var in "${shell_var[@]}";
  do
    if [[ ${var} =~ 'DOTFILE_' ]];
    then
      echo "DOTFILE_SSH_KEY_FULL_PATH='${DOTFILE_SSH_KEY_FULL_PATH}'" > .env
    fi
  done
fi

###
# Configure Vim
###
# Install vim-plug (Required for plugin installation)
if [[ ! -f "${DOTFILE_VIM_AUTOLOAD_DIR}/plug.vim" ]];
then
  output "Install vim-plug."
  curl -fLo "${DOTFILE_VIM_AUTOLOAD_DIR}/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

# Deploy vim user configuration
output "Deploy Vim user configuration file."
cp -u .vimrc "${HOME}/.vimrc"
cp -u .vim/* "${DOTFILE_VIM_CONFIG_DIR}/"

# Install vim plugins
vim_plugins_file_timestamp="$(date -r "${DOTFILE_VIM_CONFIG_DIR}/plugins.vim" +%s)"
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
