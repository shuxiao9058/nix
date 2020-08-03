{ config, pkgs, ... }:

{
  nixpkgs.overlays = import ../packages/list.nix;

  environment.systemPackages = with pkgs;
    let
      # Packages to always install.
      common = [
        wget
        # vim
        emacs
        neovim
        tmux
        git
        unzip

        # emacs
        emacs
        wakatime
        nixfmt
        silver-searcher

        # devel tools
        gnumake
        cmake
        llvm
        clang
        boost

        # tools
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

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    tmux = {
      enable = true;
      clock24 = true;
      customPaneNavigationAndResize = true;
      reverseSplit = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      #  zsh-autoenv.enable = true;
    };
    command-not-found.enable = true;
    vim.defaultEditor = true;

    mtr.enable = true;

    # ssh = { startAgent = true; };
  };

  #   environment.etc."chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
  #     "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
}
