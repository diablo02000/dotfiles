#!/usr/bin/env bash
set -euo pipefail

# =============================================
# Script: Deploy Config Files Based on Modules
# Description: Deploys config files for specified modules (e.g., mise, Zsh plugins).
# Usage: ./deploy.sh -m "module1,module2" -z "plugin1,plugin2"
# =============================================

# --- Constants ---
readonly LOG4BASH_GITHUB_URL="https://raw.githubusercontent.com/diablo02000/log4bash/refs/heads/main/log4bash.sh"
readonly LOG4BASH_LIBRARY_FILENAME="log4bash.sh"
readonly LOG4BASH_CHECKSUM="79ac6a1b8c7c899b1469a66289798e2c0d513731627c5b024c337a147cb47488"
readonly -a AVAILABLE_MODULES=("mise" "zsh-plugins")
readonly -A ZSH_EXTERNAL_CUSTOM_PLUGINS=(
    "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
    "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
)
readonly ZSH_PLUGINS_DIR="${ZSH:-$HOME/.oh-my-zsh}/custom/plugins"

# --- Global Variables ---
help_requested=false
modules=""
zsh_plugins=""

# --- Logging Setup ---
# Download log4bash if missing
if [[ ! -f "${LOG4BASH_LIBRARY_FILENAME}" ]]; then
    if ! curl -sL -o "${LOG4BASH_LIBRARY_FILENAME}" "${LOG4BASH_GITHUB_URL}"; then
        echo -e "❌ Error: Failed to download 'log4bash' library." >&2
        exit 1
    fi
    # Verify checksum
    if ! echo "${LOG4BASH_CHECKSUM}  ${LOG4BASH_LIBRARY_FILENAME}" | sha256sum --check --status; then
        echo -e "❌ Error: Checksum verification failed for 'log4bash'." >&2
        exit 1
    fi
fi
# shellcheck disable=SC1091,SC1090
source "${LOG4BASH_LIBRARY_FILENAME}"

# --- Functions ---

# Print script usage
print_usage() {
    printf "%s\n" \
        "Usage: $(basename "$0") [-h] [-m MODULES] [-z ZSH_PLUGINS]" \
        "" \
        "Options:" \
        "  -h    Print this help message" \
        "  -m    Comma-separated list of modules to deploy (e.g., 'mise,zsh-plugins')" \
        "  -z    Comma-separated list of Zsh plugins to deploy (e.g., 'plugin1,plugin2')"
}

# Check if a module is valid
_is_module_valid() {
    local module="${1}"
    for available_module in "${AVAILABLE_MODULES[@]}"; do
        if [[ "${module}" == "${available_module}" ]]; then
            return 0
        fi
    done
    return 1
}

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

# Deploy Zsh custom plugins
deploy_zsh_custom_plugins() {
    local project_zsh_plugins_dir="oh-my-sh/custom/plugins"
    local plugins_list="${1:-all}"

    log_info "Deploying Zsh plugins to '${ZSH_PLUGINS_DIR}'"

    local -a plugins
    IFS=',' read -ra plugins <<< "${plugins_list// /}"

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

# --- Argument Parsing ---
while getopts ":m:z:h" option; do
    case "${option}" in
        m) modules="${OPTARG}" ;;
        z) zsh_plugins="${OPTARG}" ;;
        h) help_requested=true ;;
        :) log_critical "Option -${OPTARG} requires an argument" ;;
        \?) log_critical "Invalid option: -${OPTARG}" ;;
    esac
done

# --- Main Script ---
# Print usage if help requested
if [[ "${help_requested}" == true ]]; then
    print_usage
    exit 0
fi

# Ensure modules are specified
if [[ -z "${modules}" ]]; then
    log_critical "No modules specified. Use -m to specify modules."
    exit 1
fi

# Convert modules string to array
IFS=',' read -ra modules_list <<< "${modules// /}"

# Process each module
for module in "${modules_list[@]}"; do
    if ! _is_module_valid "${module}"; then
        log_warn "Module '${module}' is not valid. Skipping."
        continue
    fi

    case "${module}" in
        "mise")
            deploy_mise_config
            ;;
        "zsh-plugins")
            deploy_zsh_custom_plugins "${zsh_plugins}"
            deploy_zsh_external_custom_plugins
            ;;
        *)
            log_warn "No deployment function defined for module '${module}'. Skipping."
            ;;
    esac
done

