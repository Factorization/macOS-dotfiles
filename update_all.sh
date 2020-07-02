#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

# Update fish shell plugins
info "Updating fisher (fish package manager)..."
fish -c fisher
success "Finished updating fisher."

# Update homebrew
info "Updated brew apps..."
substep_info "Updating..."
brew update
substep_success "Finished updating."
substep_info "Brew upgrading..."
brew upgrade
substep_success "Finished upgrading."
substep_info "Cask upgrading..."
brew cask upgrade
substep_success "Finished upgrading."
substep_info "Cleanup..."
brew cleanup
substep_success "Finished cleanup."
success "Finished updating brew apps."

# Python
./python_update.sh

# Ruby Gems
./ruby/setup.sh
