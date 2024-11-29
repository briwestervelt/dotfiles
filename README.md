# Brian's incredible dotfiles and init script

## Prerequisites 

- Install Arch Linux using the [guide on the arch wiki](https://wiki.archlinux.org/title/installation_guide) and boot your new system to the tty. If you're using wifi, don't forget to pacstrap networkmanager before rebooting!
- Install all the packages we'll need for out scripts
    ``pacman -S sudo git``
- Create your user
   ``useradd -m -G wheel brian`` 
   ``passwd brian``
- Use ``sudoedit`` to permit wheel to use sudo
    ``sudoedit /etc/sudoers``
    Uncomment this line:
    ``%wheel ALL=(ALL:ALL) ALL``
- Use ``exit`` to return to tty, then log in as your new user

## Installing this setup

- Clone this repository in your home directory
    ``cd ~``
    ``git clone git@github.com:briwestervelt/dotfiles.git``
- (Optional) Review/edit the packages to be installed and services to be initialized
    - ``~/dotfiles/init_scripts/settings/packages_base_pacman``
    - ``~/dotfiles/init_scripts/settings/packages_base_aur``
    - ``~/dotfiles/init_scripts/settings/packages_nvidia_pacman``
    - ``~/dotfiles/init_scripts/settings/packages_nvidia_aur``
- Run the init script
    ``~/dotfiles/init_scripts/init.sh``
- Answer the questions the script asks
- Reboot your system and you're good to go!

