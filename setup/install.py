import os


PACKAGES = [
    # Sway
    "aur/brillo",
    "community/grim
    "community/ponymix",
    "community/sway",
    "aur/swaylock-effects-git",
    "community/rofi",
    "community/slurp
    # Apps
    "aur/chromium-snapshot-bin",
    # Communication
    "community/blueman",
    "extra/bluez",
    "extra/bluez-utils",
    "aur/openvpn-update-systemd-resolved",
    # Shell
    "community/colordiff",
    "community/fd",
    "community/fzf",
    "community/fzy",
    "extra/libqalculate",
    "community/moreutils",
    "extra/screen",
    "community/tmux",
    "extra/tree",
    "aur/universal-ctags-git",
    "community/wl-clipboard",
    # Dev
    "community/aws-cli",
    "aur/awslogs",
    "community/ccache",
    "community/docker",
    "community/docker-compose",
    "community/libmemcached",
    "community/npm",
    "community/terraform",
    # Python
    "community/ipython",
    "community/mypy",
    "community/pylama",
    "community/pyenv",
    "community/python-black",
    "extra/python-cffi",
    "community/python-language-server",
    "community/python-poetry",
    # Fonts
    "community/otf-font-awesome",
    "aur/ttf-input",
]


def install(packages):
    pkgs = " ".join(packages)
    os.system(f"yay -S --needed {pkgs}")


if __name__ == "__main__":
    install(PACKAGES)
