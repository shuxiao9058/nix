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

#  hardware.parallels.enable = false;

#   hardware.parallels.package = 
#      let src = pkgs.fetchgit { 
#  	    url = "https://github.com/shuxiao9058/prl-tools.git";
#  	    rev = "7ca697d73d70eb2538dbc415c179f3a6131deba0";
#  	    sha256 = "0d5aq8sz5wk2dnhwqv3bhkmzkkfyv138d6qpznrgsasvas6gm0d1";
#      };
#      in pkgs.linuxPackages_4_14.callPackage "${src}/default.nix" {};


#    hardware.parallels.enable = true;
#     hardware.parallels.package = 
#        let src = pkgs.fetchgit { 
#    	    url = "https://github.com/shuxiao9058/prl-tools.git";
#    	    rev = "7ca697d73d70eb2538dbc415c179f3a6131deba0";
#    	    sha256 = "1avg7acp8jjz22w7hgh8vlv9gx2i9rahi9jvs2wdy3n4mb2aj2d9";
#        };
#        in pkgs.linuxPackages_4_14.callPackage "${src}/default.nix" {};
#  

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
