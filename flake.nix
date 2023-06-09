{
  description = "My first personal NixOS flake. ";

  inputs = {
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";   

    home-manager = {                                                     
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";

  };

  outputs = { self, nixpkgs, home-manager, nix-doom-emacs, ... }@inputs: 
  let
    user = "sebastian";
    location = "/$HOME/.setup";
  in
  {
    nixosConfigurations = (
     import ./host {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs user location home-manager nix-doom-emacs;
      }
    );
  };
}
