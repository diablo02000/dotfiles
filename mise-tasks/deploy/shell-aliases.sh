#!/usr/bin/env bash

#MISE description="Deploy Shell aliases and functions"
#MISE depends=["download-logger"]

# -- Constant --
readonly LOG4BASH_LIBRARY_FILENAME="${MISE_PROJECT_ROOT}log4bash.sh"

# shellcheck disable=SC1091,SC1090
source "${LOG4BASH_LIBRARY_FILENAME}"

# -- Functions --
deploy_shell_aliases() {
	local project_homedir="homedir"

	log_info "Copying '${project_homedir}/aliases' file to '${HOME}'."
	if ! rsync -a --progress "${project_homedir}/aliases" "${HOME}"; then
		log_error "Failed to deploy aliases file."
	fi

	log_info "Copying '${project_homedir}/functions' file to '${HOME}'."
	if ! rsync -a --progress "${project_homedir}/functions" "${HOME}"; then
		log_error "Failed to deploy functions file."
	fi
}

# -- Main core --
deploy_shell_aliases
