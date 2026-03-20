{
  description = "Flake for lcaac-cli, multi-system";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = f: builtins.listToAttrs (map (system: { name = system; value = f system; }) supportedSystems);
    in {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          lcaac-cli = pkgs.callPackage ./lcaac-cli.nix { };
        }
      );
      # Optionally, set the default package for each system
      defaultPackage = forAllSystems (system: self.packages.${system}.lcaac-cli);
    };
}

