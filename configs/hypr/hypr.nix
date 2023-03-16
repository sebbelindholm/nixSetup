{ config, lib, pkgs, host, ... }:

{

  programs.hyprland = {
      enable = true;

      xwayland = {
          enable = true;
      };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
  
}