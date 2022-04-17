# Description tree

**Ordinary dotfiles here**

- `bin` - script for automating everyday tasks
- `linux` and linux/configs - my configs and scripts
- `legacy` - old configs
- `mac` - mac os configs
- `windows` - win configs and scripts

configs:
    - `inputrc` - readline key bindings

---

# Install:
```
    clone https://github.com/anokata/dotfiles.git $HOME
    echo 'source ~/dotfiles/linux/.bashrc' >> ~/.bashrc
    echo 'source ~/dotfiles/linux/.env' >> ~/.profile
```
## Intall config:
```
    cp ~/dotfiles/linux/.@(!(.|))  ~/
    cp ~/dotfiles/linux/* ~/.config # TODO: not dot
    ln configs:
        tmux
        bspcwmrc
        ...
    nvim -c :PlugInstall
```
---



