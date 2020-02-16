#!/bin/sh
# We set a fake, empty proxy here to prevent wkhtmltoimage from talking to the outside world :-((
exec /usr/bin/wkhtmltoimage --proxy http://127.0.0.2:6667 --disable-javascript --disable-plugins --allow . -f png --width 256 --crop-h 256 "$1" "$2" >/dev/null 2>/dev/null
