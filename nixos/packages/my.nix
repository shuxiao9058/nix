self: super:

{
  myPackages = {
    nix-rebuild = super.writeScriptBin "nix-rebuild" ''
      #!${self.runtimeShell}
      nix-env -f '<nixpkgs>' -r -iA myPackages
      kbuildsycoca5
    '';

    whois = self.lib.hiPrio self.whois;

    inherit (self)
      ark
      bat
      bind
      binutils
      git
      ksshaskpass
      libarchive
      lrzsz
      mono
      python3
      ripgrep

      # wm       
      i3-gaps
  };
}

# vim: sw=2 ts=2 cin
