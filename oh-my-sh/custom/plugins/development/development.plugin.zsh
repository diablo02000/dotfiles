# shellcheck disable=SC2148
# Generate gitignore
# source: https://docs.gitignore.io/install/command-line
function gi() { curl -sLw n "https://www.toptal.com/developers/gitignore/api/$*"; }

# Encode string in base64
function b64encode() {
	local string="${1}"
	echo -n "${string}" | base64
}

# Decode base64 to string
function b64decode() {
	local b64encoded="${1}"
	echo -n "${b64encoded}" | base64 -d
}

# Check if json is valid
function jsonIsValide() {
	if jq -e . >/dev/null 2>&1 <<<"${1}"; then
		echo "JSON is valid"
	else
		echo "JSON not valid"
		jq -e . >/dev/null <<<"${1}"
	fi
}

# Run git-grab and switch to repository directory
function ggb() {
	local git_url="${1}"

	# git clone project and store local directory
	dir="$(git-grab "${git_url}" | tee /dev/tty | tail -1 | awk '{print $NF}')"

	# Change directory to project dir
	cd "${dir}" || exit
}

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

alias jqv="jsonIsValide"

# Fix trim trailing whitespace from file
alias ftrailing_whitespace="sed -i 's/[ \t]*$//'"

#
# Linter
#
# Shell linter
alias scheck='shellcheck -x'
alias shfmt='shfmt -i 2 -ci -sr -s -w'
