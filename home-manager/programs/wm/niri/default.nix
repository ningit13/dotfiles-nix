{
  # Niri configuration
  xdg.configFile."niri/config.kdl".text = ''
    prefer-no-csd

    input {
        keyboard {
            xkb {
                layout "jp"
            }
        }
    }

    spawn-at-startup "awww-daemon"

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+Return { spawn "alacritty"; }
        Mod+D { spawn "fuzzel"; }
        Mod+V { spawn "sh" "-c" "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"; }
        Mod+Alt+L { spawn "swaylock" "-f"; }

        Mod+Q { close-window; }

        Mod+Left { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up { focus-window-up; }
        Mod+Down { focus-window-down; }
        Mod+Shift+Left { move-column-left; }
        Mod+Shift+Right { move-column-right; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }

        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }

        XF86AudioRaiseVolume allow-when-locked=true { spawn "swayosd-client" "--output-volume" "raise"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "swayosd-client" "--output-volume" "lower"; }
        XF86AudioMute allow-when-locked=true { spawn "swayosd-client" "--output-volume" "mute-toggle"; }

        Print { screenshot; }

        Mod+Shift+E { quit; }
    }
  '';
}
