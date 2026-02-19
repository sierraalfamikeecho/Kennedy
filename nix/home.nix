{
  config,
  pkgs,
  ...
}: {
  home.username = "sam";
  home.homeDirectory = "/home/sam";
  home.stateVersion = "25.11";
  imports = [
    ./modules/ghostty.nix
    ./modules/zed.nix
  ];

  programs.bash = {
    enable = true;
    initExtra = "
        tmux
        fastfetch
      ";
    shellAliases = {
      nixc = "sudo nvim /home/sam/.config/kennedy/configuration.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      nixf = "sudo nvim /home/sam/.config/kennedy/flake.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      nixh = "sudo nvim /home/sam/.config/kennedy/home.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      reload-nix = "sudo nixos-rebuild switch --flake /home/sam/.config/kennedy";
      firmware-menu = "sudo systemctl reboot --firmware-setup";
    };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    terminal = "tmux-256color";
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      dotbar
      harpoon
      tmux-fzf
      sysstat
      yank
      tilish
      weather
    ];
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        email = "osamwonyi_eke@protonmail.com";
        name = "Sam";
      };

      core.editor = "nvim";
    };
  };
  programs.starship = {
    enable = true;
  };
  programs.anki = {
    enable = true;
    minimalistMode = true;
    reduceMotion = true;
    theme = "dark";
    sync = {
      syncMedia = true;
      username = "twiddling_parcel406@simplelogin.com";
    };
    addons = with pkgs.ankiAddons; [
      anki-connect
      passfail2
      review-heatmap
    ];
  };
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        startupLaunch = true;
        copyPathAfterSave = true;
      };
    };
  };
  services.gammastep = {
    enable = true;
    temperature.night = 2000;
    dawnTime = "6:00-6:30";
    duskTime = "18:00-18:30";
  };
  services.playerctld = {
    enable = true;
  };
}
