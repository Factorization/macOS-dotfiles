#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

./language_managers/setup.sh
./pip/setup.sh
