self: super:

{
  userPackages = super.userPackages or  {
    inherit (self)
      graphviz
      emacs
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

      # wm       
      i3-gaps;

    nix-rebuild = super.writeScriptBin "nix-rebuild"
        ''
          #!${super.stdenv.shell}
  	exec nix-env -f '<nixpkgs>' -r -iA userPackages
        '';
  };
}

# vim: sw=2 ts=2 cin
