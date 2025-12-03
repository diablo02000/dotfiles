#!/usr/bin/env bash
set -euo pipefail

# =============================================
# Script: Deploy Config Files Based on Modules
# Description: Deploys config files for specified modules.
# Usage: ./deploy.sh -m "module1,module2"
# =============================================

# --- Dependency: log4bash ---
# https://github.com/diablo02000/log4bash.git
declare -r LOG4BASH_GITHUB_URL="https://raw.githubusercontent.com/diablo02000/log4bash/refs/heads/main/log4bash.sh"
declare -r LOG4BASH_LIBRAIRY_FILENAME="log4bash.sh"
declare -r LOG4BASH_CHECKSUM="483e89d9225932dfc58a95387ef3b672b4ca20c2ceb9dc4057d144223dd39c2d"

# Download log4bash if missing
if [[ ! -f "${LOG4BASH_LIBRAIRY_FILENAME}" ]]; then
	if ! curl -sL -o "${LOG4BASH_LIBRAIRY_FILENAME}" "${LOG4BASH_GITHUB_URL}"; then
		echo -e "❌ Unexpected error: Failed to download 'log4bash' librairy." >&2
		exit 1
	fi

	# Verify checksum
	if ! echo "${LOG4BASH_CHECKSUM}" "${LOG4BASH_LIBRAIRY_FILENAME}" | sha256sum --check --status; then
		echo -e "❌ Unexpected error: Checksum verification failed for 'log4bash'." >&2
		exit 1
	fi
fi

# Load 'log4bash' librairy
# shellcheck disable=SC1091
source log4bash.sh

# Init help variable to false
HELP=false
MODULES=""

declare -ra AVAILABLE_MODULES_LIST=("mise")

# Print script usag helper
usage() {
	printf "%s\n" \
		"Usage: $(basename "$0") [-h] [-m MODULES]" \
		"" \
		"Options:" \
		"  -h    Print this help message" \
		"  -m    Comma-separated list of modules to deploy"
}

# Verify that module is available in the script
module_is_valid() {
	local module="${1}"
	local is_valid=1

	for available_module in "${AVAILABLE_MODULES_LIST[@]}"; do
		if [[ "${module}" == "${available_module}" ]]; then
			is_valid=0
			break
		fi
	done

	return ${is_valid}
}

deploy_mise() {
	local mise_config_dir="${HOME}/.config/mise/conf.d"
	local project_mise_config_dir="mise/conf.d"

	log_info "Deploying 'mise' config"

	if [[ ! -d "${mise_config_dir}" ]]; then
		log_warn "'${mise_config_dir}' directory is missing. Script is creating it."
		mkdir -p "${mise_config_dir}"
	fi

	if ! rsync -a --progress "${project_mise_config_dir}/" "${mise_config_dir}"; then
		log_error "Failed to deploy mise config in ${mise_config_dir}"
	fi
}

# Parse script arguments
while getopts ":m:h" option; do
	case $option in
	m) MODULES=${OPTARG} ;;
	h) HELP=true ;;
	:) log_critical "L'option $OPTARG requiert un argument" ;;
	\?) log_critical "$OPTARG : option invalide" ;;
	esac
done

# Print script usage if asked
if [[ "${HELP}" == true ]]; then
	usage
	exit 0
fi

# Ensure that user specify modules parameters.
if [[ -z "${MODULES}" ]]; then
	log_critical "No modules specified. Use -m to specify modules."
fi

# --- Main script ---

# Convert string to array
IFS="," read -ra MODULES_LIST <<<"${MODULES// /}"

for module in "${MODULES_LIST[@]}"; do
	# Ensure module is handle by the scriot
	if ! module_is_valid "${module}"; then
		log_warn "'${module}' is not a valid module name."
		continue
	fi

	# Run deploy for the module
	case "${module}" in
	"mise") deploy_mise ;;
	*) log_warn "No deployment function define for the module '${module}'." ;;
	esac
done
