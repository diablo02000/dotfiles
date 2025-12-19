#!/usr/bin/env bash

#MISE description="Deploy Ghotty configurations"
#MISE depends=["download-logger"]

# -- Constant --
readonly LOG4BASH_LIBRARY_FILENAME="${MISE_PROJECT_ROOT}log4bash.sh"
readonly GHOTTY_CONFIG_DIR="${HOME}/.config/ghostty/"

# shellcheck disable=SC1091,SC1090
source "${LOG4BASH_LIBRARY_FILENAME}"

# -- Functions --
deploy_ghotty_configurations() {
	local project_ghotty_config_dir="config/ghostty/"

	log_info "Copying '${project_ghotty_config_dir}' file to '${GHOTTY_CONFIG_DIR}'."
	if ! rsync -a --progress "${project_ghotty_config_dir}" "${GHOTTY_CONFIG_DIR}"; then
		log_error "Failed to deploy Ghostty configurations."
	fi
}

# -- Main core --
deploy_ghotty_configurations
