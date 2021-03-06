#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR"
cd ..
cd merged
echo "MERGING"
node merge.js
echo "BABEL"
sleep 1s
babel --presets es2015 total.js > total.min.js
echo "UGLIFY"
uglifyjs total.min.js --quotes=1 -c -m -o total.js
echo "LICENSE"
node merge.js --minify
echo "DONE"