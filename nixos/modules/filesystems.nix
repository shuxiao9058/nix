{ config, lib, pkgs, ... }:

let
  bootDev = "/dev/disk/by-uuid/2884-CBF7";
  rootfsDev = "/dev/disk/by-uuid/e51b0d9f-4b5c-4dbd-9d2c-07bfeefa6431";
  swapDev = "/dev/disk/by-uuid/22c3c7c5-7ab8-4199-b9fb-811813c2381f";

  in {
    fileSystems = {
      "/" = {
        device = rootfsDev;
        fsType = "ext4";
      };
  
      "/boot" = {
        device = bootDev;
        fsType = "vfat";
      };
  };

  swapDevices = [ { device = swapDev; } ];

  nix.maxJobs = lib.mkDefault 4;
}
