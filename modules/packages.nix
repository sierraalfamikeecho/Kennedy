{
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    flameshot
    typst
    quickemu
    qemu
    git
    neovim
    btop
    fastfetch
    zed-editor
    anki
    brave
    steam-run
    gh
    gdb
    fzf
    yazi
    zathura
    gimp
    davinci-resolve
    tenacity
    obs-studio
    obsidian
    ghostty
    verible
    ruff
    oterm
    tmux
    wl-clipboard
    kicad
    wlogout
    xdg-desktop-portal-wlr
    wl-clipboard
    wl-clip-persist
    cliphist
    gammastep
    ungoogled-chromium
    koruri
    tor-browser
    playerctl
    lm_sensors
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.victor-mono
    nerd-fonts.ubuntu-sans
    noto-fonts-cjk-sans
    nerd-fonts.caskaydia-cove
  ];
}
