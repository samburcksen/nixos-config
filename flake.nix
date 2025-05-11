{
  description = "My NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    nixosConfigurations = {
      sburcksen = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };

        modules = [ ./nixos/configuration.nix ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/desktop.nix
          ./modules/base.nix
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/laptop.nix
          ./modules/base.nix
        ];
      };

      nas = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/nas.nix
          ./modules/base.nix
        ];
      };
    };
  };
}
