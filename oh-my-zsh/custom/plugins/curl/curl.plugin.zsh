# shellcheck disable=SC2148
# -- Templates --
# Template: Measures and displays timing metrics for each step of a curl request.
typeset -g CURL_TIME_TAKEN_TMPL="
%{method} %{url} => %{http_code}

time_namelookup:  %{time_namelookup} seconds
time_connect:  %{time_connect} seconds
time_appconnect:  %{time_appconnect} seconds
time_pretransfer:  %{time_pretransfer} seconds
time_redirect:  %{time_redirect} seconds
time_starttransfer:  %{time_starttransfer} seconds
----------
time_total:  %{time_total} seconds"

# Template: Measures TCP bandwidth (download/upload speed and size).
typeset -g CURL_BANDWITH_TMPL="
%{method} %{url} => %{http_code}

download: %{speed_download} bytes/sec (size: %{size_download} bytes)
upload: %{speed_upload} bytes/sec (size: %{size_upload} bytes)"

# -- Aliases --
# cl: Run curl with silent and follow redirect options.
alias cl='curl -Ls --show-error'

# jcl: Send HTTP request with JSON Content-Type. Usage: jcl <url>
alias jcl='curl -Ls --show-error -H "Content-Type: application/json"'

# tcl: Send HTTP request and output time taken at each step. Usage: tcl [url]
alias tcl='curl -Ls -o /dev/null --show-error -w "${CURL_TIME_TAKEN_TMPL}"'

# bcl: Send HTTP request and measure TCP bandwidth. Usage: bcl [url]
alias bcl='curl -Ls -o /dev/null --show-error -w "${CURL_BANDWITH_TMPL}"'

# vcl: Verbose curl for debugging. Usage: vcl [url]
alias vcl='curl -Lv'
