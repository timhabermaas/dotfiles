{
  inputs.nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/*";
  inputs.helix = {
    url = "github:helix-editor/helix";
    # If this ever breaks due to helix using some feature from nixos-unstable, remove it
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, helix, ... }:
    let pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in {
      packages.aarch64-darwin.default = pkgs.buildEnv {
        name = "global-tools";
        paths = with pkgs; [
          pi-coding-agent
          jujutsu
          llama-cpp
          devenv direnv
          helix.packages.aarch64-darwin.default
        ];
      };
    };
 }
