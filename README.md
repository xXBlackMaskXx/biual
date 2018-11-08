# biual

My fine .dotfiles for Arch Linux.

## Install

Open terminal and type:

```bash
$ git clone --bare https://gitlab.com/dawidpotocki/biual.git $HOME/.config/biual-git
$ alias biual='/usr/bin/git --git-dir=$HOME/.config/biual-git/ --work-tree=$HOME'
$ biual checkout
```

If it will fail and show message like this:

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

You can backup these files with this simple method:

```bash
$ mkdir -p .config/config-backup && \
$ biual checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
$ xargs -I{} mv {} .config/config-backup/{}
```

Or just remove them:

```bash
$ biual checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
$ xargs -I{} rm -rf {}
```

Re-run to check out if you have still problems:

```bash
$ biual checkout
```

Pull submodules (zgen, neovim plugins etc.):

```bash
$ biual submodule update --init --recursive
```

Set the flag showUntrackedFiles to no for biual git repository:

```bash
$ biual config --local status.showUntrackedFiles no
```

As you can see your $HOME directory have LICENSE and README.md, we can tell git to always assume that they are unchanged and remove them:

```bash
$ biual update-index --assume-unchanged LICENSE README.md
$ rm -rf LICENSE README.md
```

You can revert this setting with `--no-assume-unchanged` flag instead.

### Dependencies

Arch official repository packages:

```bash
$ sudo pacman -S i3-gaps compton termite neovim ranger xclip qutebrowser zathura pamixer rofi nitrogen ttf-font-awesome ttf-dejavu zsh polkit-gnome unclutter xcape python-pip
```

AUR packages ([install manually](https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages) or using AUR helper like [yay](https://github.com/Jguer/yay)):

```bash
$ yay -S light i3lock-fancy-git redshift-minimal ttf-dejavu-sans-mono-powerline-git polybar
```

Python packages:

```bash
$ sudo pip3 install neovim
``` 

If you use bash or other shell type this to switch to zsh:

```bash
$ chsh -s /usr/bin/zsh
```

### Finished
That's it, biual dotfiles are ready! It is recommended to restart your computer. Also now you can type `biual` commands to update dotfiles or other stuff just like using regular `git` commands:

```bash
$ biual status
$ biual pull
$ biual add
$ biual commit
$ biual push
```

## FAQ

> What does 'biual' mean?

It means "btw i use arch linux".

> Will these configs works on other distributions than Arch Linux?

Yes, but some distributions may not have required packages in repository, so you will have to compile them manually.

> Why polybar doesn't show my wireless network?

You have to change `interface = wlp3s0`. See `ip link` to know to what value you have to change.

```config
~/.config/polybar/config

;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Wireless Network / Wi-Fi
;~~~~~~~~~~~~~~~~~~~~~~~~~~
[module/wireless-network]
type = internal/network
interface = wlp3s0
```

> Why my screen is yellow/red at day/night?

This is because I use redshift, which is set to my location (New Zealand).

```config
~/.config/i3/config

# Set redshift to your location: http://www.geonames.org/
exec --no-startup-id redshift -l -43.53:172.63 -b 1.0:0.9 -t 6500:3500
```

You can comment out this line or change it to your location. I really recommend it when you are using your computer a lot at night.

> Why mpd/ncmpcpp doesn't see my music at XDG_MUSIC_DIR?

If you are using different language than English you probably have your XDG directories in your language instead of English. You have to change `"~/Music"` to your Music directory name:

```config
~/.config/mpd/mpd.conf

music_directory    "~/Music"
```
