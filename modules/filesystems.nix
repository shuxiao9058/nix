{ config, lib, pkgs, ... }:

let
  bootDev = "/dev/disk/by-uuid/9459-558A";
  rootfsDev = "/dev/disk/by-uuid/547cac0d-673a-4ece-92fd-8a3d770a75f2";
  swapDev = "/dev/disk/by-uuid/0643f0b3-8a63-4c67-9af5-90d0b1471f48";

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

  swapDevices = [{ device = swapDev; }];

  #   fileSystems."/media/workspace" = {
  #     device = "workspace";
  #     fsType = "vboxsf";
  #   };
  #
  nix.maxJobs = lib.mkDefault 4;
}
