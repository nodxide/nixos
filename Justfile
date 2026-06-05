# Default recipe:
default:
    @just --list

set shell := ["bash", "-uc"]


# Switch to current user's Home Manager config
switch:
    home-manager switch --flake ~/.config/nixos#alex --impure


# Build without switching (dry run)
build:
    home-manager build --flake ~/.config/nixos#alex --impure



# Rebuild and switch NixOS configuration: workstation
nixos-switch:
    sudo nixos-rebuild switch --flake ~/.config/nixos/#workstation


# Only build NixOS (no switch): workstation
nixos-build:
    nixos-rebuild build --flake ~/.config/nixos/#workstation


# Boot into new NixOS generation: workstation
nixos-boot:
    sudo nixos-rebuild boot --flake ~/.config/nixos/#workstation


# Test NixOS config (activates but doesn't persist): workstation
nixos-test:
    sudo nixos-rebuild test --flake ~/.config/nixos/#workstation


# Update all flake inputs
update:
    nix flake update


# Garbage collection
gc:
    nix-collect-garbage -d


# Deep garbage collection
gc-deep:
    echo "Running deep GC..."
    nix-collect-garbage --delete-old
    nix store optimise


# Clean old Home Manager generations
clean-hm:
    home-manager expire-generations '-30 days'


# Full cleanup
clean:
    gc-deep
    clean-hm


# Format all Nix files
fmt:
    nix fmt


# Check flake
check:
    nix flake check


# Show flake outputs
show:
    nix flake show


# Show current Home Manager generations
generations:
    home-manager generations


# List installed packages
packages:
    home-manager packages


# Build and then show a message
rebuild:
    just build
    @echo -e "\033[1;32mBuild successful! Run 'just switch' to apply.\033[0m"


