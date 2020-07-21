{ config, lib, pkgs, ... }:

let

# /dev/sda1: LABEL_FATBOOT="boot" LABEL="boot" UUID="9459-558A" TYPE="vfat" PARTUUID="ab916a1d-511a-354e-9936-88e3e85bbe29"
# /dev/sda2: LABEL="swap" UUID="0643f0b3-8a63-4c67-9af5-90d0b1471f48" TYPE="swap" PARTUUID="dad80d15-650f-7f4d-bc3c-343689dd4c69"
  bootDev = "/dev/disk/by-uuid/9459-558A";
  rootfsDev = "/dev/disk/by-uuid/547cac0d-673a-4ece-92fd-8a3d770a75f2";
  swapDev = "/dev/disk/by-uuid/0643f0b3-8a63-4c67-9af5-90d0b1471f48";
# /dev/sda3: UUID="547cac0d-673a-4ece-92fd-8a3d770a75f2" TYPE="ext4" PARTUUID="6c222f7e-0370-c545-b201-bad8fad121bd"

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
 
#  fileSystems."/Users/jiya/workspace" =
#     { device = "workspace";
#       fsType = "vboxsf";
#     };

  nix.maxJobs = lib.mkDefault 4;
}
