#!/usr/bin/env bash

#MISE description="Deploy Zsh plugins"
#MISE depends=["download-logger"]
#USAGE flag "--custom_plugins [plugin_name]" help="Comma separated plugin list"
#USAGE flag "--remote_custom_plugins" help="Deploy custom plugin from Github"

# -- Constant --
readonly ZSH_PLUGINS_DIR="${ZSH:-$HOME/.oh-my-zsh}/custom/plugins"
readonly -A ZSH_EXTERNAL_CUSTOM_PLUGINS=(
	"zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
	"zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
)
# shellcheck disable=SC2154
readonly CUSTOM_PLUGINS="${usage_custom_plugins}"
readonly REMOTE_CUSTOM_PLUGINS="${usage_remote_custom_plugins:-false}"
readonly LOG4BASH_LIBRARY_FILENAME="${MISE_PROJECT_ROOT}log4bash.sh"

# shellcheck disable=SC1091,SC1090
source "${LOG4BASH_LIBRARY_FILENAME}"

# --- Functions ---
# Deploy Zsh custom plugins
deploy_zsh_custom_plugins() {
	local project_zsh_plugins_dir="oh-my-zsh/custom/plugins"
	local plugins_list="${1:-all}"

	log_info "Deploying Zsh plugins to '${ZSH_PLUGINS_DIR}'"

	local -a plugins
	IFS=',' read -ra plugins <<<"${plugins_list// /}"

	if [[ "${plugins_list}" == "all" ]]; then
		log_info "Deploying all Zsh custom plugins from '${project_zsh_plugins_dir}'"
		if ! rsync -ra --progress "${project_zsh_plugins_dir}/" "${ZSH_PLUGINS_DIR}"; then
			log_error "Failed to deploy Zsh plugins to '${ZSH_PLUGINS_DIR}'"
			return 1
		fi
	else
		for plugin in "${plugins[@]}"; do
			if [[ ! -d "${project_zsh_plugins_dir}/${plugin}" ]]; then
				log_warn "Plugin '${plugin}' not found in '${project_zsh_plugins_dir}'"
				continue
			fi
			log_info "Deploying '${plugin}' Zsh custom plugin."
			if ! rsync -ra --progress "${project_zsh_plugins_dir}/${plugin}" "${ZSH_PLUGINS_DIR}"; then
				log_error "Failed to deploy Zsh plugin '${plugin}' to '${ZSH_PLUGINS_DIR}'"
			fi
		done
	fi
}

deploy_zsh_external_custom_plugins() {
	for plugin in "${!ZSH_EXTERNAL_CUSTOM_PLUGINS[@]}"; do
		if [[ -d "${ZSH_PLUGINS_DIR}/${plugin}" ]]; then
			log_info "'${plugin}' Zsh external custom plugin already deployed"
			if ! cd "${ZSH_PLUGINS_DIR}/${plugin}"; then
				log_error "Failed to change directory to '${ZSH_PLUGINS_DIR}/${plugin}'"
				continue
			fi

			# Get default origin branch
			default_origin_branch="$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')"
			if ! git pull origin "${default_origin_branch}"; then
				log_error "Failed to update '${plugin}' from remote origin"
			fi
			log_info "'${plugin}' updated from '${default_origin_branch}' branch"
		else
			log_info "Clone '${plugin}' from '${ZSH_EXTERNAL_CUSTOM_PLUGINS[$plugin]}'"
			if ! cd "${ZSH_PLUGINS_DIR}"; then
				log_error "Failed to change directory to '${ZSH_PLUGINS_DIR}'"
				continue
			fi
			if ! git clone "${ZSH_EXTERNAL_CUSTOM_PLUGINS[$plugin]}"; then
				log_error "Failed to clone '${plugin}'"
				continue
			fi
			log_info "'${plugin}' Zsh external custom plugin deployed in '${ZSH_PLUGINS_DIR}'"
		fi
	done
}

# -- Main core --`
if [[ -n "${CUSTOM_PLUGINS}" ]]; then
	deploy_zsh_custom_plugins "${CUSTOM_PLUGINS}"
fi

if [[ "${REMOTE_CUSTOM_PLUGINS}" == "true" ]]; then
	deploy_zsh_external_custom_plugins
fi
