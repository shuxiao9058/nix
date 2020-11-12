{ config, lib, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
  ];
  # [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix> ];

  boot.initrd.availableKernelModules =
    [ "uhci_hcd" "xhci_pci" "ehci_pci" "ata_piix" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # Virtualbox additions
  environment.systemPackages = with pkgs;
    [ linuxPackages.virtualboxGuestAdditions ];

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ libGL ];
    setLdLibraryPath = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_4_14;
  virtualisation = {
    virtualbox.host.enable = true;
    virtualbox.guest.enable = true;
  };

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
