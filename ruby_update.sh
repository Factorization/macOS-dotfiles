#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

./rbenv/setup.sh
./ruby/setup.sh
