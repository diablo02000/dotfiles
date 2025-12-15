# shellcheck disable=SC2148
# -- Aliases --
# fixws: Fix trailing whitespace in a file
alias fixws="sed -i 's/[ \t]*$//'"
# shchk: Run shellcheck command
alias shchk='shellcheck -x'
# shfmt: Run shfmt command and save change to the file
alias shfmt='shfmt -i 2 -ci -sr -s -w'
