#!/usr/bin/env bash

#MISE description="Deploy mise configuration"
#MISE depends=["download-logger"]

# -- Constant --
readonly LOG4BASH_LIBRARY_FILENAME="${MISE_PROJECT_ROOT}log4bash.sh"

# shellcheck disable=SC1091,SC1090
source "${LOG4BASH_LIBRARY_FILENAME}"

# -- Functions --
# Deploy mise configuration
deploy_mise_config() {
	local mise_config_dir="${HOME}/.config/mise/conf.d"
	local project_mise_config_dir="mise/conf.d"

	log_info "Deploying 'mise' configuration to ${mise_config_dir}"
	if [[ ! -d "${mise_config_dir}" ]]; then
		log_warn "Directory '${mise_config_dir}' does not exist. Creating it."
		mkdir -p "${mise_config_dir}"
	fi
	if ! rsync -a --progress "${project_mise_config_dir}/" "${mise_config_dir}"; then
		log_error "Failed to deploy mise config to '${mise_config_dir}'"
		return 1
	fi
}

# -- Main core --
deploy_mise_config
