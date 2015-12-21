{ supportedSystems ? [ "x86_64-linux" "i686-linux" "x86_64-darwin" ]
, system ? builtins.currentSystem
, nixpkgs
}:

with (import <nixpkgs/pkgs/top-level/release-lib.nix> {
  inherit supportedSystems;

  packageSet = { system, config }: let pkgs = import <nixpkgs> { inherit system; }; in {
    corkscrew = pkgs.corkscrew;
  };
});

mapTestOn {
  corkscrew = all;
}
