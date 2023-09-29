{ nixpkgs }:
let
  fish-config-string = import ./config.nix { inherit nixpkgs; };
  fish-config-file = nixpkgs.stable.writeText "cdm.fish" fish-config-string;
  fish-shell = nixpkgs.stable.wrapFish { localConfig = fish-config-string; };
in
{
  packages = { inherit fish-config-file fish-shell; };
}
