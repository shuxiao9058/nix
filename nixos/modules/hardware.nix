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

#   boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
#   boot.initrd.kernelModules = [ ];
#   boot.kernelModules = [ "kvm-intel" ];
#   boot.extraModulePackages = [ ];

  # nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
