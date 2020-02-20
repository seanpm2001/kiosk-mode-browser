#!/bin/sh

# default url
url="www.toradex.com"

# default parms for kiosk mode
chromium_parms_base="--test-type --allow-insecure-localhost --disable-notifications --check-for-update-interval=315360000 "
chromium_parms="--kiosk "

for arg in "$@"
do
    case $arg in
    --window-mode)
        chromium_parms="--start-maximized --app="
        shift
        ;;
    --browser-mode)
        chromium_parms="--start-maximized "
        shift
    esac
done

if [ ! -z "$1" ]; then
    url=$1
fi

exec chromium $chromium_parms_base $chromium_parms$url
