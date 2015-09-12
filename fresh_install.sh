###############################################################################
#                                                                             #
# This is a script to ease the process of a fresh Archbang Linux installation #
#                                                                             #
###############################################################################

# Fix the mirrorlist to include only Greek mirrors

sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.original
wget "https://www.archlinux.org/mirrorlist/?country=GR&protocol=https&ip_version=4" -O ~/mirrors
sudo sed 's/^..//' ~/mirrors > /etc/pacman.d/mirrorlist
rm ~/mirrors

# Remove archassault repository
sudo head -n -4 /etc/pacman.conf >> /etc/pacman.conf

# Install archlinuxfr repository
sudo printf "%s\n%s\n%s\n" "[archlinuxfr]" "SigLevel = Never" "Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf

# Update repositories and installed applications
sudo pacman -Syu

# Replace bash with zsh
sudo pacman -S zsh --noconfirm
chsh -s $(which zsh)

# Install necessary applications
sudo pacman -S --noconfirm coreutils yaourt vim git xclip i3 chromium base-devel feh qbittorrent skype vlc deadbeef ardour smplayer kodi util-linux

# Install from AUR
yaourt -S --noconfirm oh-my-zsh squeeze-git

