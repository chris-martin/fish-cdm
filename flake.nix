{
  inputs = {
    stable.url =  "github:nixos/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        nixpkgsArgs = {
          inherit system;
          config = { };
        };

        nixpkgs = {
          stable = import inputs.stable nixpkgsArgs;
        };

      in
      import ./nix { inherit nixpkgs; }
    );
}
