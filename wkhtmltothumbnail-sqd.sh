#!/bin/bash

if ! [[ $1 =~ \.sqd$ ]]; then
    # not an .sqd file
    exit;
fi

# Extract the HTML file named "index.html" from the .sqd file, create thumbnail from that HTML file
# We fake the (implied) encoding to UTF-8
# We set a fake, empty proxy here to prevent wkhtmltoimage from talking to the outside world :-((
unzip -p "$1" index.html \
    | perl -ple 'BEGIN{print qq(<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head><body>)}; END{print qq(</body></html>)}' \
    | /usr/bin/wkhtmltoimage --proxy http://127.0.0.2:0 --disable-javascript --disable-plugins --allow . -f png --width 256 --crop-h 256 "-" "$2" \
    >/dev/null 2>/dev/null
