{ ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "github_dark_colorblind";
    settings = {
      terminal = {
        osc52 = "CopyPaste";
      };

      window = {
        opacity = 0.9;
        startup_mode = "Maximized";
      };

      font = {
        size = 13.5;
        normal = {
          family = "CaskaydiaMono Nerd Font Mono";
          style = "Regular";
        };
      };

      mouse = {
        hide_when_typing
        bindings = [
          {
            mouse = "Right";
            mode = "AppCursor";
            action = "Paste";
          }
        ];
      };

      selection = {
        save_to_clipboard = true;
      };

      keyboard.bindings = [
        {
          key = "d";
          mods = "Alt";
          action = "CreateNewWindow";
        }
      ];
    };
  }
}
