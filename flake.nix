{
  description = "nixos + flakes + Home Manager  configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    zen-browser = {
	url = "github:0xc000022070/zen-browser-flake";
	inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... } @ inputs :
    let
      inherit (self) outputs;
      settings = {
	  # User Configuration
	  username = "yourusername";
	  editor = "nvim";
	  terminal = "kitty";
	  browser = "zen";

	  # System configuration
	  preferred-hostname = null; # "yourhostname"
	  timezone = "America/New_York";
	};

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {

      nixosConfigurations = {
	  daily = nixpkgs.lib.nixosSystem {
	     system = system;
	     specialArgs = { inherit self inputs outputs; } // settings;
	     modules = [ ./hosts/daily/configuration.nix ];
	    }; 
      };
      homeConfigurations = {
	     daily = inputs.home-manager.lib.homeManagerConfiguration {
		inherit pkgs;
		extraSpecialArgs = { inherit self inputs outputs; } // settings ;

		# Specify your home configuration modules here, for example,
		# the path to your home.nix.
		modules = [ ./homes/daily ];

		# Optionally use extraSpecialArgs
		# to pass through arguments to home.nix
	      };
       };
    };
}
