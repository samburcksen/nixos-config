{
  description = "My NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      inherit (nixpkgs) lib;

      unfreePackages = [
        "nvidia-x11"
        "spotify"
      ];

      specialArgs = {
        modules = import ./modules lib;
        allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) unfreePackages;
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = false;
          inherit (specialArgs) allowUnfreePredicate;
        };
      };

      # For usage with nixos
      homeManager = {
        imports = [ home-manager.nixosModules.home-manager ];
        home-manager = {
          users."sburcksen" = self.homeManagerModules.default;
          useUserPackages = true;
          useGlobalPkgs = true;
        };
      };
    in
    {
      homeManagerModules.default = import ./home;

      # For standalone usage
      homeConfigurations.sburcksen = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ self.homeManagerModules.default ];
      };

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          inherit specialArgs;
          modules = [
            ./hosts/desktop
            ./modules/base.nix
            homeManager
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          inherit specialArgs;
          modules = [
            ./hosts/laptop
            ./modules/base.nix
            homeManager
          ];
        };

        nas = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          inherit specialArgs;
          modules = [
            ./hosts/nas
            ./modules/base.nix
          ];
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
