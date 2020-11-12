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

            # (emacsUnstable.override { withGTK2 = false; withGTK3 = false; }) # Emacs 27

        # # emacs
        # emacsWithPackagesFromUsePackage
        # {
        #   config = builtins.readFile ./emacs.el;
        #   # Package is optional, defaults to pkgs.emacs
        #   package = pkgs.emacsGit;
        #   # By default emacsWithPackagesFromUsePackage will only pull in packages with `:ensure t`.
        #   # Setting alwaysEnsure to true emulates `use-package-always-ensure` and pulls in all use-package references.
        #   alwaysEnsure = true;
        #   # Optionally provide extra packages not in the configuration file
        #   extraEmacsPackages = epkgs: [ epkgs.cask ];
        #   # Optionally override derivations
        #   override = epkgs:
        #     epkgs // {
        #       weechat = epkgs.melpaPackages.weechat.overrideAttrs
        #         (old: { patches = [ ./weechat-el.patch ]; });
        #     };
        # }

        wakatime
        nixfmt
        silver-searcher

        # devel tools
        gnumake
        cmake
        llvm
        clang
        boost

        # java
        # java

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
  };

  #  services.emacs = with pkgs; {
  #   enable = true;
  #   defaultEditor = true;
  #   package = ((emacsPackagesGen).emacsWithPackages (epkgs: [
  #       epkgs.vterm
  #     ]));
  # };

  #   environment.etc."chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
  #     "${pkgs.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
}
