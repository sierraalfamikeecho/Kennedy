{
  config,
  pkgs,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    extraPackages = [pkgs.nixd];
    themes = {
      mode = "system";
      dark = "compline";
      light = "compline";
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
    extensions = [
      "nix"
      "verilog"
      "astro"
      "probe-rs"
      "compline"
      "make"
      "toml"
      "basher"
      "neocmake"
      "tcl"
      "pylsp"
      "gdscript"
      "csharp"
      "assembly"
      "haskell"
      "typst"
      "vhdl"
      "opencode"
      "colored-zed-icons-theme"
    ];
  };
}
