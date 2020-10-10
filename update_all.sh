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
