{ config, pkgs, ... }:

{
  nixpkgs.overlays = import ../packages/list.nix;
  # $ nix search wget
  # environment.systemPackages = with pkgs; [ wget vim emacs git ];

  environment.systemPackages = with pkgs;
    let
      # Packages to always install.
      common = [
        neovim
        tmux
        git
        unzip
        # emacs
        emacs
        wakatime
        nixfmt
        silver-searcher
        lrzsz
        python3
        coreutils
      ];

      noxorg = [ ];

      # if xorg enabled, install these pkgs
      xorg = [ xclip graphviz ];

      # fcitx-configtool
      # utillinux
      # pciutils
      # nvidia-offload
    in common ++ (if config.services.xserver.enable then xorg else noxorg);

  programs.vim.defaultEditor = true;

  programs.mtr.enable = true;

  # programs.wireshark.enable = true;

  programs.ssh = { startAgent = true; };

  #   environment.etc."chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
  #     "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
}
