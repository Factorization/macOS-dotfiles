#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

# Update fish shell plugins
info "Updating fisher (fish plugin manager)..."
fish -c fisher
success "Finished updating fisher."

# Update homebrew
info "Updated brew apps..."
substep_info "Updating..."
brew update
substep_info "Upgrading..."
brew upgrade
substep_info "Cask upgrading..."
brew cask upgrade
substep_info "Cleanup..."
brew cleanup
success "Finished updating brew apps."

# Python
./python_update.sh

# Ruby Gems
./gem/setup.sh
