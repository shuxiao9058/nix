{ config, pkgs, ... }:

{
  boot = {


  loader.systemd-boot.enable = true;
  loader.timeout = 0;
  # loader.efi.canTouchEfiVariables = true;

  # Use the GRUB 2 boot loader.
  loader.grub.enable = true;
  loader.grub.version = 2;
  loader.grub.efiSupport = true;
  loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  loader.grub.device = "nodev";

#     kernelPackages = pkgs.linuxPackages_5_6;
#     kernelParams = [ "quiet" ];
# 
#     extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];


    kernel.sysctl = {
      "vm.swappiness" = 5;
      "vm.vfs_cache_pressure" = 50;
      "kernel.sysrq" = 1;
    };

  };

  # Switch kernel to 4.14 for Parallels compatibility
  boot.kernelPackages = pkgs.linuxPackages_4_14;

  hardware.cpu.intel.updateMicrocode = true;
}
