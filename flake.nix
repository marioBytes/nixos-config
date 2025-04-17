{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, stylix, ... } @inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
				inputs.stylix.nixosModules.stylix
      ];
    };

		# nixosConfigurations.home = nixpkgs.lib.nixosSystem {
			# specialArgs = {inherit inputs;};
			# modules = [
				# ./configuration.nix
				# home-manager.nixosModules.home-manager {
					# home-manager.useGlobalPkgs = true;
					# home-manager.useUserPkgs = true;
				# }
				# stylix.nixosModules.stylix
			# ];
		# };
  };
}

