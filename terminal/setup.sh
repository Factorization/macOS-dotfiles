#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/Library/Preferences)"

info "Copying terminal configuration..."

find * -name "*.plist" | while read fn; do
    substep_info "Copying terminal preference list..."
    cp -f "$SOURCE/$fn" "$DESTINATION/$fn"
    substep_info "Note: Terminal will need to be restarted to take effect."
done

success "Finished copying Terminal configuration."
