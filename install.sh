#!/bin/env bash

cargo build --release

BIN=$(find target/release -maxdepth 1 -type f ! -name "*.*" | head -n 1)
DIR="/usr/local/bin"
[ -n "$(command -v termux-setup-storage)" ] && DIR="$PREFIX/bin"

if [[ "$DIR" == "/usr/local/bin" ]]; then
    sudo mv "$BIN" "$DIR/"
else
    mv "$BIN" "$DIR/"
fi

chmod +x "$DIR/$(basename "$BIN")"
echo -e "Done
Execute shortner to run the tool
"

