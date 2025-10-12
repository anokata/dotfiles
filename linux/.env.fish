# Paths
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx DOTFILES "$HOME/dotfiles"
set -gx DOC "$HOME/Dropbox/doc"
set -gx DOTFILES_LINUX "$DOTFILES/linux"
set -gx DOTFILES_BIN "$DOTFILES_LINUX/bin"
set -gx DOTFILES_SESSION "$DOTFILES_BIN/session/"
set -gx DOTFILES_CONFIGS "$DOTFILES_LINUX/configs/"
set -gx VIM_DIR "$HOME/.config/nvim"
set -gx VIM_DIR_CONFIGS "$HOME/.config/nvim/lua/"
set -gx KSI_BASHRC "$DOTFILES_LINUX/.bashrc"
set -gx KSI_ENV "$DOTFILES_LINUX/.env"

set -gx PATH $PATH "$HOME/bin" "/usr/sbin" "$DOTFILES/linux/bin" "$DOTFILES/linux/bin/ndm" "$DOTFILES/linux/bin/hktool" "$DOTFILES/linux/bin/ai" "$HOME/ndm/bin" "$HOME/.dropbox-dist" "/snap/bin/" "~/Downloads/WebStorm-221.5921.27/bin/" "~/gits/git-fuzzy/bin/"

set -gx GIT_DOC https://anokata@bitbucket.org/anokata/doc.git
set -gx BACKUPS "$HOME/Dropbox/backups"
set -gx NOTES_DIR "$HOME/Dropbox/doc"
set -gx LINKS_DIR "$HOME/dirs"
set -gx LF_BOOKMARK_PATH "$HOME/bookmarks"
set -gx GITS_DIR "$HOME/gits"

set -gx EDITOR "nvim"
set -gx TERMINAL "kitty"
set -gx MUSIC_PLAYER "ncmpcpp"
set -gx IMAGE_VIEW "feh"
set -gx VIDEO_VIEW "mpv"

# Main medias
set -gx HDD1 "$HOME/ddata"
set -gx HDD2 "$HOME/adata"

# NDM work
set -gx WORK_DIR "$HOME/ndm/"
set -gx WORK_DIR_CURRENT4 "$WORK_DIR/ndw4/"
set -gx WORK_DIR_CURRENT2 "$WORK_DIR/ndw2/"
set -gx WORK_DIR_CURRENT5 "$WORK_DIR/ndw5/"
set -gx WORK_REPO_NDW2 "git@github.com:ndmsystems/ndw2.git"
set -gx WORK_REPO_NDW4 "git@github.com:ndmsystems/ndw4.git"
set -gx PASSWORD_DEFAULT "$HOME/.secrets/.password.default"
set -gx PASSWORD_DEFAULT_KSI "$HOME/.secrets/.default.keenetic"
set -gx PASSWORD_DEFAULT_OPKG "$HOME/.secrets/.default.keenetic"
set -gx WORK_EMAIL 's.tikhomirov@ndmsystems.com'
set -gx KSI_EMAIL 'quartenium@gmail.com'
set -gx NODE_OPTIONS "--max-old-space-size=8192"
set -gx KEENETIC_OFFICE_VIVA_IP (cat ~/.secrets/.keenetic-office-viva-ip)
set -gx TEST_KEENETIC_EXTRA "172.16.77.254:1713"
set -gx TEST_KEENETIC_HOPPER "172.16.77.254:3810"
set -gx TEST_KEENETIC_HOPPER_SSH "172.16.77.254:4107"
set -gx TEST_KEENETIC_HOPPER_DSL "172.16.77.254:3610"
set -gx TEST_KEENETIC_SKIPPER_4G "172.16.77.254:2910"
set -gx TEST_KEENETIC_GIANT "172.16.77.254:2610"
set -gx TEST_KEENETIC_GIGA "172.16.77.254:1011"
set -gx TEST_KEENETIC_ULTRA_MWS "172.16.77.254:1811"

# Network
set -gx DEFAULT_GW "192.168.1.1"

# Music
set -gx MPD_PORT 6601

set -gx FZF_DEFAULT_COMMAND 'rg --files --follow --hidden -g "!{node_modules/,.git/}"'

# webstorm ui fix
set -gx _JAVA_AWT_WM_NONREPARENTING 1

# LANG
set -gx CLUTTER_IM_MODULE ibus
set -gx GLFW_IM_MODULE ibus
set -gx GTK_IM_MODULE ibus
set -gx QT4_IM_MODULE ibus
set -gx QT_IM_MODULE ibus
set -gx XMODIFIERS @im=ibus

### API keys
set -gx OPENAI_API_KEY (cat ~/.secrets/.openai.key)
set -gx OPENAI_API_KEY2 (cat ~/.secrets/.openai.key2)
set -gx GEMINI_API_KEY (cat ~/.secrets/.gemini.key)
set -gx OPENROUTER_API_KEY (cat ~/.secrets/.openrouter.key)
set -gx OPENROUTER_MODEL deepseek/deepseek-r1

# NDM
set -gx KEENETIC_IP_SKIPPER "192.168.25.1"
set -gx NODE_VERSION 22
set -gx SSH_PORT 22
set -gx SSH_USER admin

### Sec
set -gx WORDLIST "/usr/share/wordlists/dirbuster/"
set -gx SECLIST "~/pwn/SecLists/"

set -gx XKB_DEFAULT_OPTIONS caps:escape
