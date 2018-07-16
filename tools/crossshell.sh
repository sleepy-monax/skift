#!/bin/bash

# Activate the toolchain

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PATH="$DIR/../cross/bin:$PATH"
export TOOLCHAIN="$DIR"
echo "$PATH"

exec /bin/bash