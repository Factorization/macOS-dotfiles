#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/.config)"

info "Configuring flake8..."

symlink "$SOURCE/flake8" "$DESTINATION/flake8"


success "Finished configuring flake8."
