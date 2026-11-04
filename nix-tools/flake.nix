{
   inputs.nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/*";

   outputs = { nixpkgs, ... }:
     let pkgs = nixpkgs.legacyPackages.aarch64-darwin;
     in {
       packages.aarch64-darwin.default = pkgs.buildEnv {
         name = "global-tools";
         paths = with pkgs; [
           pi-coding-agent
           devenv direnv
         ];
       };
     };
 }
