rec {
  description = "ClanLib game SDK development files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nix.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nix, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = flake-utils.lib.flattenTree {
          clanlib = pkgs.stdenv.mkDerivation {
            pname = "clanlib";
            version = "1.0.0";
            src = nixpkgs.lib.cleanSource ./.;
            enableParallelBuilding = true;
            preConfigure = "./autogen.sh";
            nativeBuildInputs = [
              pkgs.autoconf
              pkgs.automake
              pkgs.gcc
              pkgs.libtool
              pkgs.perl
              pkgs.pkgconfig
            ];
            buildInputs = [
              pkgs.SDL
              pkgs.SDL_gfx
              pkgs.alsa-lib
              pkgs.libjpeg
              pkgs.libmikmod
              pkgs.libogg
              pkgs.libpng
              pkgs.libvorbis
              pkgs.libvorbis
              pkgs.xorg.libXi
              pkgs.xorg.libXmu
              pkgs.xorg.libXxf86vm
            ];
            propagatedBuildInputs = [
              pkgs.xorg.xorgproto
              pkgs.xorg.libX11
              pkgs.libGL
              pkgs.libGLU
            ];
           };
        };
        defaultPackage = packages.clanlib;
      });
}
