# Configuration variables
# Define workspace base directory
DEFAULT_WORKSPACE_ROOT_DIR="${HOME}/workspaces"
: ${WORKSPACE_ROOT_DIR:=$DEFAULT_WORKSPACE_ROOT_DIR}

# Functions
# Create daily working directory.
function createWorkingSpace() {
  local WORKSPACE="${WORKSPACE_ROOT_DIR}/$(date +%F)"
  [[ ! -d "${WORKSPACE}" ]] && mkdir -p "${WORKSPACE}"
  cd "${WORKSPACE}"
}

function changeDirectoryToWorkspaceDir(){
  # one char = 1 day
  local days_before="${1}"

  if [[ -z "${days_before}" ]];
  then
    # Create new directory
    createWorkingSpace
  else
    # Get parameters length
    nbr_days="${#days_before}"
    cd "${WORKSPACE_ROOT_DIR}/$(date -d "-${nbr_days} day" +%F)"
  fi
}

function selectWorkspaceDir(){
  local formatted_date=""

  # List folder in Workspace dir
  for i in $(find ${DEFAULT_WORKSPACE_ROOT_DIR} -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
  do
    # Convert date to full date
    formatted_date+="$(date -d"${i}" +%A" "%d" "%B)\n"
  done

  folder="$(echo -e "${formatted_date}" | fzf +m)"
  cd "${DEFAULT_WORKSPACE_ROOT_DIR}/$(date -d"${folder}" +%F)"
}

# Aliases
alias cdw='changeDirectoryToWorkspaceDir'
alias cdrw='selectWorkspaceDir'
