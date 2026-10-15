# arch_dotfiles

Managed with GNU Stow. Each top-level folder is a package that mirrors `$HOME`:

```
helix/.config/helix/config.toml  ->  ~/.config/helix/config.toml
bash/.bashrc                     ->  ~/.bashrc
```

`.stowrc` sets the target to `~`, so stow runs from this folder.

## Setup on a new machine

```sh
git clone https://github.com/icingtea/arch_dotfiles ~/Desktop/arch_dotfiles
cd ~/Desktop/arch_dotfiles
sudo pacman -S --needed - < package_lists/pacman.txt
paru -S --needed - < package_lists/aur.txt
stow alacritty bash fastfetch git helix spicetify starship zellij
```

## Adding a config

```sh
mkdir -p foo/.config/foo
mv ~/.config/foo/foo.conf foo/.config/foo/
stow foo
```

`~/scripts/dotfiles-doctor` checks for stray links, re-stows, and refreshes `package_lists/`.
