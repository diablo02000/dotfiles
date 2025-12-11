# shellcheck disable=SC2148
# Check if json is valid
function jsonIsValide() {
	if jq -e . >/dev/null 2>&1 <<<"${1}"; then
		echo "JSON is valid"
	else
		echo "JSON not valid"
		jq -e . >/dev/null <<<"${1}"
	fi
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
