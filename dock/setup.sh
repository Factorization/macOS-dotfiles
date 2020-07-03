#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/Library/Preferences)"

info "Copying dock configuration..."

find * -name "*.plist" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
    defaults read "$DESTINATION/$fn" &>/dev/null
done

success "Finished copying dock configuration."
