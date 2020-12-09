#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

# Ensure sudo
info "Prompting for sudo password..."
if sudo -v; then
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

# Update fish shell plugins
info "Updating fisher (fish package manager)..."
fish -c fisher
success "Finished updating fisher."

# Update homebrew
info "Updating brew apps..."
substep_info "Brew update..."
brew update
substep_success "Finished updating."
substep_info "Brew upgrade..."
brew upgrade
substep_success "Finished upgrading."
substep_info "Cask upgrade..."
brew upgrade --cask
substep_success "Finished upgrading."
substep_info "Cleanup..."
brew cleanup
substep_success "Finished cleanup."
success "Finished updating brew apps."

# Go update
./go_update.sh

# Python update
./python_update.sh

# Ruby update
./ruby_update.sh

# Node update
./node_update.sh
