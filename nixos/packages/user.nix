# https://nixos.wiki/wiki/FAQ#Why_not_use_nix-env_-i_foo.3F
# bootstrap with: nix-env -f '<nixpkgs>' -r -iA userPackages

self: super: {
  userPackages = super.userPackages or  {} // {
    ## nix (nscd, https://github.com/NixOS/nix/issues/599)
    inherit (self)
      graphviz
      nix-index
      ark
      bat
      bind
      binutils
      git
      lrzsz
      mono
      python3

      coreutils
      silver-searcher
      ripgrep

      watchexec

      # emacs
      emacs
      xclip
      wakatime

      nixfmt;

      # wm       
      # i3-gaps;

    ## helper script to keep user env clean
    nix-rebuild = super.writeScriptBin "nix-rebuild"
        ''
          #!${super.stdenv.shell}
  	exec nix-env -f '<nixpkgs>' -r -iA userPackages
        '';
  };
}

# vim: sw=2 ts=2 cin
