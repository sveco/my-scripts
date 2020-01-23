@echo off
REM wget is required, use "scoop install wget"
wget --header "Content-Type: text/plain" --header "Accept: application/json" --post-data "%1" "http://192.168.1.99:8080/rest/items/ColorBulbFirstEdition_Brightness" -O NUL