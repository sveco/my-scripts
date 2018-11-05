@echo off
curl -s %1 | pup %2 | sed "s/<[^>]\+>//g;s/^[ \t]*//;/^$/d"