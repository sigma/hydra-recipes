{ supportedSystems ? [ "x86_64-linux" "i686-linux" ]
, system ? builtins.currentSystem
, nixpkgs
, patchesRepo
}:

with (import <nixpkgs/pkgs/top-level/release-lib.nix> {
  inherit supportedSystems;

  packageSet = { system, config }: let pkgs = import <nixpkgs> { inherit system; }; in {
    ncurses = pkgs.vtmate_ncurses;
    libevent = pkgs.vtmate_libevent;
    openssl = pkgs.vtmate_openssl;
    zlib = pkgs.vtmate_zlib;
    vtmate = pkgs.vtmate.override { inherit patchesRepo; };
  };
});

mapTestOn {
  ncurses = linux;
  libevent = linux;
  openssl = linux;
  zlib = linux;
  vtmate = linux;
}
