#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/.config/mypy)"

info "Configuring mypy..."
mkdir -p "$DESTINATION"

symlink "$SOURCE/mypy" "$DESTINATION/config"


success "Finished configuring mypy."
