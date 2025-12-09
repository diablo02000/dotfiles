# shellcheck disable=SC2148
# --- Tool Paths ---
# Use absolute paths to mise shims for reliability.
# This ensures the plugin works even if mise is not activated in the current shell.
typeset -gr FD_BIN="${HOME}/.local/share/mise/shims/fd"
typeset -gr FZF_BIN="${HOME}/.local/share/mise/shims/fzf"
typeset -gr EZA_BIN="${HOME}/.local/share/mise/shims/eza"

# --- Helper Functions ---
# Validates if required tools are available.
_validate_tools() {
    # Validate tool availability
    if [[ ! -x "${FD_BIN}" ]]; then
      echo "❌ Error: fd not found at ${FD_BIN}" >&2
      return 1
    fi

    if [[ ! -x "${FZF_BIN}" ]]; then
      echo "❌ Error: fzf not found at ${FZF_BIN}" >&2
      return 1
    fi

    if [[ ! -x "${EZA_BIN}" ]]; then
      echo "❌ Error: eza not found at ${EZA_BIN}" >&2
      return 1
    fi
}

# Validates if directory is selected.
# Usage: _directorySelected <path>
# Returns: 0 if selected, 1 if not
_directorySelected() {
  if [[ -z "${1}" ]]; then
    echo -e "❌ Directory not selected. Command aborted !!" >&2
    return 1
  fi
  return 0
}

# --- Core Function ---
# _fuzzy_fd: Change directory using fuzzy search with fd and fzf.
# Usage: _fuzzy_fd [path] [pattern]
#   path:   Base directory to search (default: current directory)
#   pattern: Search pattern (default: none)
_fuzzy_fd() {
  # Validate tool availability
  _validate_tools

  local path="${1:-.}"  # Default to current directory
  local pattern="${2}"  # Search pattern

  # Search for directories, preview with eza, and select with fzf
	local dir
	dir=$("${FD_BIN}" --type d --hidden --follow --format '{//}' "${pattern}" "${path}" | "${FZF_BIN}" +m --preview "${EZA_BIN} --icons=auto -T --color=always {}")

  if _directorySelected "${dir}"; then
    if cd "${dir}"; then
      echo -e "▶️ Changed directory to ${dir}"
    else
      echo -e "❌ Failed to change directory."
      return 1
    fi
  fi
}

# --- Aliases ---
# cdg: Change to a Git repository in ~/Gits
alias cdg='_fuzzy_fd "${HOME}/Gits" ".git$"'
