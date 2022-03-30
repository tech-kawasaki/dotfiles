#!/bin/zsh

# +--------+
# | iTerm2 |
# +--------+
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# +----------+
# | Keyboard |
# +----------+
# キーリピートの高速化
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# スペルの訂正を無効にする
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
# CapsLock を command に変更する
keyboard_id="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)-0"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771299</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"

# +-------+
# | Mouse |
# +-------+
# タップしたときに、クリックとする
defaults write -g com.apple.mouse.tapBehavior -int 1
# マウスの速度を速める
defaults write -g com.apple.mouse.scaling 5

# +--------+
# | Finder |
# +--------+
# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES
# Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# 拡張子変更時の警告を無効化する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true

# Show Tab bar in Finder （タブバーを表示）
defaults write com.apple.finder ShowTabView -bool true

# +------+
# | Dock |
# +------+
# Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true
# Wipe all app icons from the Dock
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 38
# Disable hot corner
defaults delete com.apple.dock wvous-tl-corner
defaults delete com.apple.dock wvous-tl-modifier
# 拡大しない
defaults delete com.apple.dock magnification

# 上記設定後は、Finder と Dock を再起動する
killall Finder
killall Dock

# +---------+
# | General |
# +---------+
# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library
# 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Avoid creating `.DS_Store` files on network volumes （ネットワークディスクで、`.DS_Store` ファイルを作らない）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.screencapture location ~/Downloads
killall SystemUIServer