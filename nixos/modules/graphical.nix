{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

#     libinput.enable = true;

#     displayManager.sddm = {
#       enable = true;
#       extraConfig = ''
#         [X11]
#         ServerArguments=-nolisten tcp -dpi 132
#         MinimumVT=1
#         [User]
#         HideUsers=hex
#       '';
#     };

# displayManager.gdm.enable = true;
# displayManager.defaultSession = "";

    desktopManager = {
      xterm.enable = false;
      # default = "none";
    };

   displayManager = {
     defaultSession = "none+i3";
     # gdm.enable = true;
   };

    displayManager.lightdm = {
      enable = true;
      background = "/etc/nixos/resources/images/wall2.jpg";
      greeters.gtk = {
        enable = true;
        clock-format = "%a, %d %b %y, %I:%M %p";
        indicators = [ "~host" "~spacer" "~clock" "~spacer" "~session" "~a11y" "~power" ];
        extraConfig = "
          default-user-image = /etc/nixos/resources/images/nixos-logo-only-hires.png
          font-name = Roboto Mono 16
          a11y-states=+font";
      };
    };

    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
      # default = "i3";
    };

#     windowManager.i3-gaps = {
#        # enable = true;
#        extraPackages = with pkgs; [
#          # dmenu # application launcher most people use
#          # i3status-gaps # gives you the default i3 status bar
#          # i3lock-gaps #default i3 screen locker
#          i3blocks-gaps # if you are planning on using i3blocks over i3status
#       ];
#     };

    # windowManager.default = "i3-gaps";


 #    # desktopManager.plasma5.enable = true;
 #    windowManager.i3 = {
 #      enable = true;
 #      extraPackages = with pkgs; [
 #        dmenu #application launcher most people use
 #        i3status # gives you the default i3 status bar
 #        i3lock #default i3 screen locker
 #        i3blocks #if you are planning on using i3blocks over i3status
 #     ];
 #    };

#     xkbOptions = "terminate:ctrl_alt_bksp,caps:ctrl_modifier";

#    videoDrivers = [ "nvidia" ];
  };

#  hardware.nvidia.prime = {
#    intelBusId = "PCI:0:2:0";
#    nvidiaBusId = "PCI:1:0:0";
#    offload.enable = true;
#  };

  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];

 #  i18n.inputMethod = {
 #    enabled = "fcitx";
 #    fcitx.engines = with pkgs.fcitx-engines; [ libpinyin rime ];
 #  };

  fonts.fonts = with pkgs; [
    sarasa-gothic
  ];

  fonts.enableFontDir = true;

  fonts.fontconfig.defaultFonts = {
    monospace = [ "Sarasa Mono SC" ];
    sansSerif = [ "Sarasa UI SC" ];
    serif = [ "Sarasa UI SC" ];
  };
}
