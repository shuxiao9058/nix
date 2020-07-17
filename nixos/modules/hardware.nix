{ config, lib, pkgs, ... }:

{
  imports =
   #  [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix> ];
    [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
    ];


  boot.initrd.availableKernelModules = [ "uhci_hcd" "xhci_pci" "ehci_pci" "ata_piix" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  hardware.parallels.enable = true;

  hardware.parallels.package = 
     let src = pkgs.fetchgit { 
 	    url = "https://github.com/saaadhu/prl-tools.git";
 	    rev = "e42c51e38a74ec161da80da5c56f99204f2a67b4";
 	    sha256 = "0d5aq8sz5wk2dnhwqv3bhkmzkkfyv138d6qpznrgsasvas6gm0d1";
     };
     in pkgs.linuxPackages_4_14.callPackage "${src}/default.nix" {};

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
