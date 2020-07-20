# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./modules/boot.nix
      ./modules/filesystems.nix
      ./modules/graphical.nix
      ./modules/hardware.nix
      ./modules/nix.nix
      ./modules/system.nix
    ];

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s5.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget vim emacs git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.openssh.enable = true;
  # services.openssh.authorizedKeysFiles = [".ssh/authorized_keys"];
  # services.openssh.passwordAuthentication = false; # originally true
  services.openssh.permitRootLogin = "yes";
  services.openssh.challengeResponseAuthentication = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };
  users.users.jiya = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzb0t+erUVWg9FyLYcjqt1fYSMYAmIGz+yw9iXDVb+gxzzlcpzwjGbDixfpOELkTRlN1lfN0yDbeGqCzvM1ET4EZIFvmhl/IQJDYdzwIlRZMAPhIw4cEJ3NVpkMkdUzJjqfzbKZYcVvmnXBVVLGFUmEi+7t7zhyH8O7NA9THKKPCnRUp+FDVrtxmhHzY6D/kmLKcPQzctX8Z2BjRAXgc2nBO6XH+UN0s0oEN+o1zjO1Gouv/gD5HWUz5LAVFLC3zlfskT0MXtdcXW5w/KWukCtgSl3Lvp7fQZH2DVV8WDPi+i8o0eFOgd2gPXBifoEJj04vBr2O7m6fwiFFXV2TSNt jiya@centos-linux.shared" ];
  };

  # users.extraUsers.root.openssh.authorizedKeys.keys = [ "ssh-rsa AAAA... davidak" ];
   users.extraUsers.root.openssh.authorizedKeys.keys  = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzb0t+erUVWg9FyLYcjqt1fYSMYAmIGz+yw9iXDVb+gxzzlcpzwjGbDixfpOELkTRlN1lfN0yDbeGqCzvM1ET4EZIFvmhl/IQJDYdzwIlRZMAPhIw4cEJ3NVpkMkdUzJjqfzbKZYcVvmnXBVVLGFUmEi+7t7zhyH8O7NA9THKKPCnRUp+FDVrtxmhHzY6D/kmLKcPQzctX8Z2BjRAXgc2nBO6XH+UN0s0oEN+o1zjO1Gouv/gD5HWUz5LAVFLC3zlfskT0MXtdcXW5w/KWukCtgSl3Lvp7fQZH2DVV8WDPi+i8o0eFOgd2gPXBifoEJj04vBr2O7m6fwiFFXV2TSNt jiya@centos-linux.shared" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}



