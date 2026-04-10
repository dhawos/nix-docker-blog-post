{
  description = "Development environments for this project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    systems = [
      "x86_64-linux"
      "aarch64-darwin"
    ];
  in {
    devShells = builtins.listToAttrs (
      builtins.map (system:  let 
        pkgs = import nixpkgs { inherit system; };
        shell = pkgs.mkShell {
          packages = [
            pkgs.go
            pkgs.golangci-lint
            pkgs.templ
          ];
        };
      in {
        name = system;
        value =  { 
          default = shell;
        };
      }) systems
    );
  };
}
