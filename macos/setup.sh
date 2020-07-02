#! /usr/bin/env bash

# Taken from:
# ~/.macos — https://mths.be/macos
# Amended to work for my personal preferences

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

info "Setting macOS defaults..."

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#### General ####
# System Preferences > General > Appearance
defaults write -globalDomain AppleInterfaceStyle -string "Dark"

# System Preferences > General > Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain AppleScrollerPagingBehavior -bool true

# System Preferences > General > Sidebar icon size: Medium
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2

#### Desktop & Screen Saver ####
# System Preferences > Desktop & Screen Saver > Start after: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

#### Dock ####
# System Preferences > Dock > Size:
defaults write com.apple.dock tilesize -int 47

# System Preferences > Dock > Magnification:
defaults write com.apple.dock magnification -bool true

# System Preferences > Dock > Size (magnified):
defaults write com.apple.dock largesize -int 107

# System Preferences > Dock > Position on screen: Bottom
defaults write com.apple.dock orientation -string "bottom"

# System Preferences > Dock > Minimize windows using: Genie effect
defaults write com.apple.dock mineffect -string "genie"

# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# System Preferences > Dock > Automatically hide and show the Dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.5

# System Preferences > Dock > Automatically hide and show the Dock (delay)
defaults write com.apple.dock autohide-delay -float 0

# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

#### Mission Control ####
# System Preferences > Mission Control > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

#### Keyboard ####
# System Preferences > Keyboard > Key Repeat
defaults write NSGlobalDomain KeyRepeat -int 2

# System Preferences > Keyboard > Delay Until Repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

#### Trackpad ####
# System Preferences > Trackpad > Point & Click >  Look up & data detectors
defaults write com.apple.trackpad.forceClick -int 1

# System Preferences > Trackpad > Point & Click > Secondary click: Click with two fingers
defaults write com.apple.trackpad.enableSecondaryClick -int 1
defaults write com.apple.trackpad.trackpadCornerClickBehavior -int 0

# System Preferences > Trackpad > Point & Click > Tap to click: Disable
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# System Preferences > Trackpad > Scroll & Zoom > Scroll direction: Natural disabled
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# System Preferences > Trackpad > Scroll & Zoom > Zoom in or out
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true

# System Preferences > Trackpad > Scroll & Zoom > Smart zoom
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true

# System Preferences > Trackpad > Scroll & Zoom > Rotate
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true

#### Finder ####
# Finder > Preferences > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Show warning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > View > Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set New Finder window show: Home directory
defaults write com.apple.finder NewWindowTarget -string "PfHm"

#### Others ####
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

#### Terminal ####
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "cfprefsd" \
	"Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done

success "Finished setting macOS defaults. Note that some of these changes require a logout/restart to take effect."
