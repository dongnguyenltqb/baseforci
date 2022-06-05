#!/bin/bash
if [[ -d node_modules ]]; then
	echo "=> node_modules was existed."
fi
time npm install
mkdir -p build
echo "haha" > build/result.txt