{ config, pkgs, ... }:

{
  #  services.xserver.config = ''
  # # DefaultFlags section
  # Section "ServerFlags"
  # 	Option	"AllowEmptyInput"	"yes"
  # 	Option	"AutoAddDevices"	"yes"
  # EndSection
  # # Parallels Video section
  # Section "Device"
  # 	Identifier	"Parallels Video"
  # 	Driver	"prlvideo"
  # EndSection
  # # Parallels Monitor section
  # Section "Monitor"
  # 	Identifier	"Parallels Monitor"
  # 	VendorName	"Parallels Inc."
  # 	ModelName	"Parallels Monitor"
  # EndSection
  # # Parallels Screen section
  # Section "Screen"
  # 	Identifier	"Parallels Screen"
  # 	Device	"Parallels Video"
  # 	Monitor	"Parallels Monitor"
  # 	Option	"NoMTRR"
  # 	SubSection	"Display"
  # 		Depth	24
  # 		Modes	"1024x768" "800x600" "640x480"
  # 	EndSubSection
  # EndSection
  # # DefaultFlags section
  # Section "ServerFlags"
  # 	Option	"AllowEmptyInput"	"yes"
  # 	Option	"AutoAddDevices"	"yes"
  # EndSection
  # # DefaultLayout section
  # Section "ServerLayout"
  # 	Identifier	"DefaultLayout"
  # 	Screen	"Parallels Screen"
  # EndSection
  #    '';
  #
  services.xserver = {
    enable = true;
    layout = "us";

    libinput.enable = true;

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
      defaultSession = "none+awesome";
      # gdm.enable = true;
    };

    displayManager.lightdm = {
      enable = true;
      background = "/etc/nixos/resources/images/wall2.jpg";
      greeters.gtk = {
        enable = true;
        clock-format = "%a, %d %b %y, %I:%M %p";
        indicators =
          [ "~host" "~spacer" "~clock" "~spacer" "~session" "~a11y" "~power" ];
        extraConfig =
          "\n          default-user-image = /etc/nixos/resources/images/nixos-logo-only-hires.png\n          font-name = Roboto Mono 16\n          a11y-states=+font";
      };
    };

    windowManager = {
      awesome = {
        enable = true;
        luaModules = [
          pkgs.luaPackages.vicious
          # pkgs.awesome-wm-widgets
        ];
      };
      #   i3 = {
      #     enable = true;
      #     package = pkgs.i3-gaps;
      #   };
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

  fonts.fonts = with pkgs; [ sarasa-gothic ];

  fonts.enableFontDir = true;

  fonts.fontconfig.defaultFonts = {
    monospace = [ "Sarasa Mono SC" ];
    sansSerif = [ "Sarasa UI SC" ];
    serif = [ "Sarasa UI SC" ];
  };
}
