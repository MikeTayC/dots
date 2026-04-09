#!/bin/bash
# Add third party apps to bracket expansion
apps=(/Applications/{"iTerm","Vivaldi","Firefox","Google Chrome","Visual Studio Code","WebStorm","Slack"}.app)


# To add other system apps use bracket expansion like above(e.g. {"System Preferences","Mail"})
sys=(/System/Applications/'System Settings.app')

# merge them for looping
dockItems=( "${apps[@]}" "${sys[@]}" )

# clear items
defaults write com.apple.dock persistent-apps -array

for i in "${dockItems[@]}"; do
    echo "Adding $i to dock.."
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$i</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

# refresh the dock
Killall Dock

echo "Finished!"
