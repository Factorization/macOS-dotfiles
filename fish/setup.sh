#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/.config/fish)"

info "Setting up fish shell..."

substep_info "Creating fish config directories..."
mkdir -p "$DESTINATION/functions"
mkdir -p "$DESTINATION/completions"
mkdir -p "$DESTINATION/conf.d"
substep_success "Finished creating directories."

find * -name "*.fish" -not -name "000-env.fish" -o -name "fishfile" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
find * -name "000-env.fish" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/conf.d/$fn"
done
clear_broken_symlinks "$DESTINATION"

set_fish_shell() {
    if grep --quiet fish <<< "$SHELL"; then
        success "Fish shell is already set up."
    else
        substep_info "Adding fish executable to /etc/shells"
        if grep --fixed-strings --line-regexp --quiet "/usr/local/bin/fish" /etc/shells; then
            substep_success "Fish executable already exists in /etc/shells."
        else
            if sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"; then
                substep_success "Fish executable added to /etc/shells."
            else
                substep_error "Failed adding Fish executable to /etc/shells."
                return 1
            fi
        fi
        substep_info "Changing shell to fish"
        if chsh -s /usr/local/bin/fish; then
            substep_success "Changed shell to fish"
        else
            substep_error "Failed changing shell to fish"
            return 2
        fi
    fi
}

if set_fish_shell; then
    success "Successfully set up fish shell."
else
    error "Failed setting up fish shell."
fi
