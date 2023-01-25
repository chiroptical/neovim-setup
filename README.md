# neovim-setup

DEPRECATED: Upgrading the Fennel bits to keep this running was too frustrating.
I am now using: https://github.com/chiroptical/kickstart.nvim which is a fork I am modifying.

## TODO

- Replace vim-plug with niv + nixpkgs vim plugins

## Setting up

```
git clone https://github.com/chiroptical/neovim-setup ~/.config/nvim
cd ~/.config/nvim
nix-build # this will grab aniseed so we can bootstrap vim plug
# copy neovim install instructions from https://github.com/junegunn/vim-plug
vim -c ":PlugInstall"
vim -c ":COQdeps"
```

## Fennel References

- [Tutorial](https://fennel-lang.org/tutorial)
- [Aniseed](https://github.com/Olical/aniseed): automatically load fennel -> lua when opening vim
- [Conjure](https://github.com/Olical/conjure): **TODO**
