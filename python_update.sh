#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

./pyenv/setup.sh
./python/setup.sh
