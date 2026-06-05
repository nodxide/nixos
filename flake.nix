{
  description = "Modular NixOS configuration for development and daily use";

  # * Inputs
  inputs = {
    # Stable package set used by the system
    # (updated only for major NixOS releases):
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Rolling package set for selectively pulling newer software
    # without upgrading the entire system:
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Handles user-level configuration
    # (shell, packages, themes, editors and dotfiles):
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";

      # Prevents a second nixpkgs evaluation:
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware-specific NixOS modules for laptops, desktops,
    # mini PCs, servers and other supported devices:
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Declarative disk partitioning and filesystem management:
    disko = {
      url = "github:nix-community/disko";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Persistent state management for ephemeral systems
    # (useful for tmpfs-root and declarative persistence setups):
    impermanence.url = "github:nix-community/impermanence";

    hyprland = {
      url = "github:hyprwm/Hyprland";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    # System-wide theming framework
    # (generates colors, fonts, cursors and etc.):
    stylix = {
      url = "github:danth/stylix/release-26.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # Offline command-line database
    # (enables package lookup without network access):
    nix-index-database = {
      url = "github:nix-community/nix-index-database";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Community-maintained package repository
    # (provides packages and modules not available in nixpkgs):
    nur.url = "github:nix-community/NUR";

    # Utility library for building large multi-host flakes
    # (helps organize flake outputs and modules):
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Canonical list of supported system architectures:
    systems.url = "github:nix-systems/default";
  };

  # * Outputs
  outputs =
    inputs@{
      self,
      flake-parts,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:
    let
      # Edit here instead of changing values in multiple files:
      vars = {
        username = "alex";
        fullName = "Aleksandr N.";
        email = "alxnem4enko@gmail.com";
        stateVersion = "26.05";
      };

      # Supported systems (x86_64-linux, aarch64-linux, etc.):
      supportedSystems = import inputs.systems;

      mkNixosSystem =
        {
          hostname,
          system ? "x86_64-linux",
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;

          # Arguments passed to all modules and home-manager:
          specialArgs = {
            inherit inputs self vars;
            unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit hostname;
          };

          modules = [
            # Host specific configuration:
            ./hosts/${hostname}/hardware-configuration.nix
            ./hosts/${hostname}/configuration.nix

            # * Flake modules:
            # System foundation:
            inputs.disko.nixosModules.disko
            inputs.impermanence.nixosModules.impermanence
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd

            # Desktop environment:
            inputs.hyprland.nixosModules.default

            # User environment:
            inputs.home-manager.nixosModules.home-manager

            # Theming & appearance:
            inputs.stylix.nixosModules.stylix

            # Flatpak support:
            inputs.nix-flatpak.nixosModules.nix-flatpak

            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";

                # Arguments passed to home-manager modules:
                extraSpecialArgs = {
                  inherit inputs self vars;
                  unstable = import nixpkgs-unstable {
                    inherit system;
                    config.allowUnfree = true;
                  };
                  # Explicitly expose these so they are available in home.nix:
                  inherit (vars) username stateVersion;
                };

                # Load user home configuration:
                users.${vars.username} = import ./home/${vars.username}/home.nix;
              };
            }
          ];
        };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = supportedSystems;

      # Per-system outputs (devShell, formatter, etc.):
      perSystem =
        { pkgs, ... }:
        {
          # Development shell with useful Nix tools:
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              # Core Nix tools:
              nixd # Nix language server (LSP)
              nixfmt
              hydra-check # Check Hydra build farm status
              nix-index # Search files provided by nix packages
              nix-init # Generate derivations from source URLs
              nix-melt # TUI viewer for flake.lock dependencies
              nix-tree # Visualize dependency graphs
              deadnix # Unused code detector
              statix # Linter
              just # Command runner (for Justfile)
              # cachix
              nvd # Nix store diff
            ];

            shellHook = ''
              echo "Nix development shell successfully loaded!"
              echo "  Current user: ${vars.username}"
              echo "  Nixpkgs version (state): ${vars.stateVersion}"
              echo "  Flake location: $(git rev-parse --show-toplevel 2>/dev/null || pwd)"
            '';
          };

          # Default formatter:
          formatter = pkgs.alejandra;
        };

      # * Flake outputs
      flake = {
        # Expose vars so other flakes can import them if needed
        inherit vars;

        # NixOS system configurations:
        nixosConfigurations = {
          workstation = mkNixosSystem {
            hostname = "workstation";
          };
        };
      };
    };
}
