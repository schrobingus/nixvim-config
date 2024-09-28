{
  description = "My Bingus-enhanced Nixvim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-parts,
    nixvim,
    ...
  } @ inputs: let
    config = ./config;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        pkgs = import nixpkgs {
          inherit system;
        };

        nixvimLib = nixvim.lib.${system};

        nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          pkgs = pkgs;
          module = config;
        };
      in {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "My Bingus-enhanced Nixvim Configuration";
            };
          };
          
          packages = {
            default = nvim;
          };

          devShells.default = pkgs.mkShellNoCC {
            packages = [ nvim ];
          };
        };
    };
}
