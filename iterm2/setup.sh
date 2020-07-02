#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/.config/iterm2)"

info "Configuring iterm2..."

substep_info "Creating iterm2 config directory..."
mkdir -p "$DESTINATION"
substep_success "Finished creating directory."

find . -name "*.plist" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

substep_info "Setting preferences custom folder..."
defaults write ~/Library/Preferences/com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write ~/Library/Preferences/com.googlecode.iterm2 PrefsCustomFolder -string "$DESTINATION"
substep_success "Finished setting preferences."

success "Finished configuring iterm2."
