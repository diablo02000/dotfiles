#######
# HTTP
#######
local CURL_TIME_TAKEN_TMPL="
%{method} %{url} => %{http_code}

time_namelookup:  %{time_namelookup} seconds
time_connect:  %{time_connect} seconds
time_appconnect:  %{time_appconnect} seconds
time_pretransfer:  %{time_pretransfer} seconds
time_redirect:  %{time_redirect} seconds
time_starttransfer:  %{time_starttransfer} seconds
----------
time_total:  %{time_total} seconds"

local CURL_BANDWITH_TMPL="
%{method} %{url} => %{http_code}

download: %{speed_download} bytes/sec
download size: %{size_download} bytes
upload: %{speed_upload} bytes/sec
upload size: %{size_upload} bytes"

# Send HTTP curl with JSON content type
alias jcurl='curl -s -H "Content-Type: application/json"'

# Send HTTP curl with trace time
alias tcurl='curl -s -o /dev/null -w "${CURL_TIME_TAKEN_TMPL}"'
alias bcurl='curl -s -o /dev/null -w "${CURL_BANDWITH_TMPL}"'

#####
# IP
#####
alias pubip='dig +short myip.opendns.com @resolver1.opendns.com'
alias privip="ip -j -br -4 addr list | jq -r '.[] | select(.operstate==\"UP\") | .addr_info[].local'"
