{ config, pkgs, lib, ... }:

{
  nix.binaryCaches = lib.mkBefore [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  nix.gc = {
    automatic = true;
    dates = "thursday";
    options = "--delete-older-than 8d";
  };

  nix.trustedUsers = [ "root" "jiya" ];

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  nixpkgs.config = {
      allowUnfree = true;
      oraclejdk.accept_license = true;
  };

  nix.nixPath = [ "nixpkgs=/var/lib/nixpkgs" "nixpkgs-overlays=/etc/nixos/packages/list.nix" ];
}
