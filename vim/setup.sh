#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE_REPO="https://github.com/amix/vimrc.git"
SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/.vim_runtime)"

info "Setting up Vim..."

# find . -name ".vim*" | while read fn; do
#     fn=$(basename $fn)
#     symlink "$SOURCE/$fn" "$DESTINATION/$fn"
# done
substep_info "Updating ultimate vimrc..."
git clone --depth=1 "$SOURCE_REPO" "$DESTINATION" 2>/dev/null || git -C "$DESTINATION" pull --rebase
substep_success "Finished updating."

substep_info "Running setup..."
sh "$DESTINATION/install_awesome_vimrc.sh"
substep_success "Finished setup."

success "Finished setting up Vim."
