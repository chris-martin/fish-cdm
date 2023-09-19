{ nixpkgs }:
{
  default = nixpkgs.stable.wrapFish {
    localConfig = import ./config.nix { inherit nixpkgs; };
  };
}