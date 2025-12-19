#!/usr/bin/env bash

#MISE description="Download Bash logger"

# -- Constant --
readonly LOG4BASH_GITHUB_URL="https://raw.githubusercontent.com/diablo02000/log4bash/refs/heads/main/log4bash.sh"
readonly LOG4BASH_LIBRARY_FILENAME="${MISE_PROJECT_ROOT}log4bash.sh"
readonly LOG4BASH_CHECKSUM="79ac6a1b8c7c899b1469a66289798e2c0d513731627c5b024c337a147cb47488"

# --- Logging Setup ---
# Download log4bash if missing
if [[ ! -f "${LOG4BASH_LIBRARY_FILENAME}" ]]; then
	if ! curl -sL -o "${LOG4BASH_LIBRARY_FILENAME}" "${LOG4BASH_GITHUB_URL}"; then
		printf "❌ Error: Failed to download 'log4bash' library.\n" >&2
		exit 1
	fi
	# Verify checksum
	if ! echo "${LOG4BASH_CHECKSUM}  ${LOG4BASH_LIBRARY_FILENAME}" | sha256sum --check --status; then
		printf "❌ Error: Checksum verification failed for 'log4bash'.\n" >&2
		exit 1
	fi

	printf "✅ Log4bash librairy downloaded."
else
	printf "▶️ Log4bash librairy already downloaded."
fi
