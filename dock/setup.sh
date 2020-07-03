#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/Library/Preferences)"

info "Copying dock configuration..."

find * -name "*.plist" | while read fn; do
    substep_info "Copying dock preference list..."
    cp -f "$SOURCE/$fn" "$DESTINATION/$fn"
    substep_info "Reading dock config..."
    defaults read "$DESTINATION/$fn" &>/dev/null
    substep_info "Restarting dock..."
    killall Dock
done

success "Finished copying dock configuration."
