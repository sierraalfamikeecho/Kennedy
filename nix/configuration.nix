{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/neovim.nix
    ./modules/packages.nix
    ./modules/kennedy.nix
    ./modules/services.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-43e7e8d4-5c4a-4f4f-9cf2-af371ef8ee36".device = "/dev/disk/by-uuid/43e7e8d4-5c4a-4f4f-9cf2-af371ef8ee36";
  networking.hostName = "kennedy"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  networking.wireless.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    isNormalUser = true;
    description = "sam";
    extraGroups = ["networkmanager" "wheel"];
    packages = [
    ];
  };

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      mozc
      anthy
    ];
  };

  nix.gc = {
    automatic = true;
    dates = [
      "weekly"
    ];
  };

  programs.systemtap.enable = true;
  programs.bash.completion.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  programs.steam = {
    enable = true;
  };
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "riscv64-linux"
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
  };
  networking.firewall.allowedUDPPorts = [41641]; # Or add 41641 to your existing list
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11"; # Did you read the comment?
}
