#!/bin/sh
# We set a fake, empty proxy here to prevent wkhtmltoimage from talking to the outside world :-((
# In turn we need to gobble up the exit code of wkhtmltoimage, because it can't connect to the proxy
/usr/bin/wkhtmltoimage --proxy http://127.0.0.2:6667 --disable-javascript --disable-plugins --allow . -f png --width 256 --crop-h 256 "$1" "$2" >/dev/null 2>/dev/null
exit 0
