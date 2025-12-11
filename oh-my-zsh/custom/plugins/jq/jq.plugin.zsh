# shellcheck disable=SC2148
# --- Tool Paths ---
# Use absolute paths to mise shims for reliability.
# This ensures the plugin works even if mise is not activated in the current shell.
typeset -g JQ_BIN="${HOME}/.local/share/mise/shims/jq"
typeset -g GRON_BIN="${HOME}/.local/share/mise/shims/gron"
typeset -g FZF_BIN="${HOME}/.local/share/mise/shims/fzf"

# --- Helper Functions ---
# Validates if required tools are available.
_validate_tools() {
	# Validate tool availability
	if [[ ! -x "${JQ_BIN}" ]]; then
		echo "❌ Error: jq not found at ${JQ_BIN}" >&2
		return 1
	fi

	if [[ ! -x "${GRON_BIN}" ]]; then
		echo "❌ Error: gron not found at ${GRON_BIN}" >&2
		return 1
	fi

	if [[ ! -x "${FZF_BIN}" ]]; then
		echo "❌ Error: fzf not found at ${FZF_BIN}" >&2
		return 1
	fi
}

# --- Core Function ---
# Encodes a URL and copies it to the clipboard.
urlencode() {
	local url="${1}"
	_validate_tools || return 1

	local encoded_url
	# shellcheck disable=SC2016
	encoded_url=$(${JQ_BIN} -rn --arg url "${url}" '$url|@uri')

	# Copy encoded_url to the clipboard using wl-copy (Wayland) or xclip (X11)
	if command -v wl-copy >/dev/null; then
		echo -n "${encoded_url}" | wl-copy
	elif command -v xclip >/dev/null; then
		echo -n "${encoded_url}" | xclip -selection clipboard
	else
		echo "❌ Error: No clipboard utility found (wl-copy or xclip required)." >&2
		return 1
	fi

	echo -e "📋 URL encoded and stored in clipboard: '${url}' => '${encoded_url}'"
}

# Validates if a JSON file is syntactically correct.
_isJsonValide() {
	local json_file="${1}"
	_validate_tools || return 1

	if ! [[ -f "${json_file}" ]]; then
		echo "❌ Error: File '${json_file}' does not exist." >&2
		return 1
	fi

	if ${JQ_BIN} -e . &>/dev/null <"${json_file}"; then
		echo -e "✅ '${json_file}' is a valid JSON file."
		return 0
	else
		echo -e "❌ '${json_file}' is NOT a valid JSON file." >&2
		${JQ_BIN} -e . <"${json_file}"
		return 1
	fi
}

# Explores and selects absolute key paths in a JSON file using gron and fzf.
_get_absolute_keys_path() {
	local json_file="${1}"
	_validate_tools || return 1

	if ! [[ -f "${json_file}" ]]; then
		echo "❌ Error: File '${json_file}' does not exist." >&2
		return 1
	fi

	"${GRON_BIN}" "${json_file}" | "${FZF_BIN}" +m
}

# --- Aliases ---
alias jqv='_isJsonValide'
alias jqex='_get_absolute_keys_path'
