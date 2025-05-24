{ config, pkgs, lib, inputs,... }:
{
  
  imports = [
   ./home.nix
   ../../modules/nixCats
    ../../modules/hyprland
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
  ];
  programs.bash.enable = true;
}

