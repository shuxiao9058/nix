{ config, pkgs, lib, ... }:

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
# resolutions = lib.mkOverride 9  {x = 2880; y = 1800;};
# virtualScreen = lib.mkOverride 9  {x = 2880; y = 1800;};
resolutions = [{x = 2880; y = 1800;}];
# virtualScreen = lib.mkOverride 9  {x = 2880; y = 1800;};

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
# auto = {
# enable = true;
# user = "root";
# };

      # gdm.enable = true;
    };

    displayManager.lightdm = {
      enable = true;
      # background = "/etc/nixos/resources/images/wall2.jpg";
      # greeters.gtk = {
      #   enable = true;
      #   clock-format = "%a, %d %b %y, %I:%M %p";
      #   indicators =
      #     [ "~host" "~spacer" "~clock" "~spacer" "~session" "~a11y" "~power" ];
      #   extraConfig =
      #     "\n          default-user-image = /etc/nixos/resources/images/nixos-logo-only-hires.png\n          font-name = Roboto Mono 16\n          a11y-states=+font";
      # };
    };

    windowManager = {
      awesome = {
        enable = true;
        luaModules = [
          pkgs.luaPackages.vicious
          # pkgs.awesome-wm-widgets
        ];
      };
    };

    #     xkbOptions = "terminate:ctrl_alt_bksp,caps:ctrl_modifier";
  };

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
