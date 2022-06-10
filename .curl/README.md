# Curl

Several cURL out formats.

**>> NOTE: You can find more informations on the [curl manpage](https://linux.die.net/man/1/curl)**

## How to use

The text files can be use with `curl` command:

```bash
~$ curl -s -o /dev/null  -w @time-taken.txt https://linux.die.net/man/1/curl

time_namelookup:  0.003129 seconds
time_connect:  0.003406 seconds
time_appconnect:  0.059326 seconds
time_pretransfer:  0.059554 seconds
time_redirect:  0.000000 seconds
time_starttransfer:  0.669313 seconds
----------
time_total:  0.818493 seconds
```
