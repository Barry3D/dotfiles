{ pkgs, ... }:

{
  ## Enable sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  ## Configure Docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    binutils
    openssl
    killall
    git
    jq
    unzip
    python3
    (python3.withPackages(ps: with ps; [ dbus ]))
    octave
    socat
    gnumake
    cmake
    gcc
    # Bar
    pkgs.eww-wayland
    # Notification daemon
    pkgs.dunst
    libnotify
    # Wallpaper daemon
    swww
    # Terminal for hyprland
    kitty
    # Terminal improvements
    pkgs.bat
    pkgs.fzf
    pkgs.zoxide
    # App launcher
    rofi-wayland
    # Misc. Apps
    chromium
    firefox
    dolphin
    pkgs.obsidian
    pkgs.jetbrains.clion
    pkgs.audacity
    pkgs.binwalk
    pkgs.ghidra
    pkgs.imagemagick
    xorg.libX11
    xorg.libX11.dev
  ];

  fonts.fonts = with pkgs; [
     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs.bash.shellAliases = {
    c = "z";
    vim = "nvim";
  };

  ## NEOVIM
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  ## STARSHIP
  programs.starship = {
    enable = true;
  };

  
  ## HYPRLAND
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
