{
  config,
  pkgs,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "verilog" "astro" "probe-rs" "base16" "make" "GDScript"];
    installRemoteServer = true;
    extraPackages = [pkgs.nixd];
    themes = {
      mode = "system";
      dark = "base16-tomorrow-night";
      light = "base16-tomorrow-night";
    };
    userSettings = {
      telemetry = {
        metrics = false;
      };
      hour_format = "hour24";
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 18;
      disable_ai = false;
      buffer_font_family = "VictorMono Nerd Font Mono";
    };
  };
}
