# shellcheck disable=SC2148
# Configuration: Define the root directory for workspaces.
# Defaults to ~/workspaces if WORKSPACE_ROOT_DIR is not set.
declare -r DEFAULT_WORKSPACE_ROOT_DIR="${HOME}/workspaces"
: "${WORKSPACE_ROOT_DIR:=$DEFAULT_WORKSPACE_ROOT_DIR}"

# --- Functions ---

# Generates a workspace directory path using the current date (YYYY-MM-DD).
# Usage: _getWorkingDir
# Returns: Path to the workspace directory.
_getWorkingDir() {
  local workspace
  workspace="${WORKSPACE_ROOT_DIR}/$(date +'%Y-%m-%d')"
  echo "${workspace}"
}

# Interactively selects a workspace directory using fzf.
# Usage: _selectWorkingDir
# Returns: Selected workspace directory path.
_selectWorkingDir() {
  local workspace
  workspace="$(fd --min-depth 1 --max-depth 1 --type d . "${WORKSPACE_ROOT_DIR}" | fzf --preview 'eza --icons=auto -T --color=always {}')"
  echo "${workspace}"
}

# Interactively selects an archived workspace (tar.xz file) using fzf.
# Usage: _selectArchivedWorkingDir
# Returns: Selected archive file path.
_selectArchivedWorkingDir() {
  local workspace
  workspace="$(fd --min-depth 1 --max-depth 1 --type f '.tar.xz$' "${WORKSPACE_ROOT_DIR}" | sort | fzf --preview 'tar -tf {}')"
  echo "${workspace}"
}

# Validates if a workspace or archive is selected.
# Usage: _workingDirSelected <path>
# Returns: 0 if selected, 1 if not
_workingDirSelected() {
  local workspace="${1}"
  if [[ -z "${workspace}" ]]; then
    echo -e "❌ working directory not selected. Command aborted !!"
    return 1
  fi
  return 0
}

# Creates a new workspace directory with the current date.
# Usage: createWorkingSpace
createWorkingSpace() {
  local workspace
  workspace="$(_getWorkingDir)"
  if [[ ! -d "${workspace}" ]]; then
    if mkdir -p "${workspace}"; then
      echo -e "📁 Created '${workspace}' working directory."
    else
      echo -e "❌ Failed to create '${workspace}' directory." >&2
      return 1
    fi
  else
    echo -e "ℹ️ Directory '${workspace}' already exists." >&2
  fi
}

# Changes to a selected or today's workspace directory.
# Usage: changeDirectoryToWorkingDir [1|0]
#   1: Use today's workspace (default if no argument)
#   0: Interactively select a workspace
changeDirectoryToWorkingDir() {
  local select_working_dir="${1:-1}"
  local workspace
  if [[ "${select_working_dir}" -eq 1 ]]; then
    workspace="$(_getWorkingDir)"
  else
    workspace="$(_selectWorkingDir)"
  fi

  if _workingDirSelected "${workspace}"; then
    # Ensure directory exists
    createWorkingSpace
    # Change directory
    if cd "${workspace}" 2>/dev/null; then
      echo -e "▶️ Changed directory to '${workspace}'."
    else
      echo -e "❌ Failed to change directory to '${workspace}'. Does it exist?" >&2
      return 1
    fi
  fi
}

# Archives a selected workspace directory as a tar.xz file.
# Usage: archiveWorkingDirectory
archiveWorkingDirectory() {
  local workspace archive_name
  workspace="$(_selectWorkingDir)"
  archive_name="$(basename "${workspace}").tar.xz"
  if _workingDirSelected "${workspace}"; then
    if [[ -n "${workspace}" ]]; then
      if tar -cJf "${WORKSPACE_ROOT_DIR}/${archive_name}" -C "${WORKSPACE_ROOT_DIR}/" "$(basename "${workspace}")"; then
        echo -e "🗜 Archived '${workspace}' to '${archive_name}'."
        rm -rf "${workspace}"
      else
        echo -e "❌ Failed to archive '${workspace}'. Check permissions or disk space." >&2
        return 1
      fi
    else
      echo -e "❌ No workspace selected." >&2
      return 1
    fi
  fi
}

# Restores an archived workspace directory.
# Usage: restoreArchivedWorkingDirectory
restoreArchivedWorkingDirectory() {
  local archived
  archived="$(_selectArchivedWorkingDir)"
  if _workingDirSelected "${archived}"; then
    if [[ -n "${archived}" ]]; then
      if tar -xJf "${archived}" -C "${WORKSPACE_ROOT_DIR}/"; then
        echo -e "🗜 Restored '$(basename "${archived}" .tar.xz)' from archive."
      else
        echo -e "❌ Failed to restore '${archived}'. Check file integrity." >&2
        return 1
      fi
    else
      echo -e "❌ No archive selected." >&2
      return 1
    fi
  fi
}

# --- Aliases ---
alias mkworkdir='createWorkingSpace'
alias cdworkdir='changeDirectoryToWorkingDir 1' # Use today's workspace
alias fdworkdir='changeDirectoryToWorkingDir 0' # Select workspace interactively
alias arworkdir='archiveWorkingDirectory'
alias reworkdir='restoreArchivedWorkingDirectory'
