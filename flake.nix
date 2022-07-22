rec {
  description = "ClanLib game SDK development files";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = flake-utils.lib.flattenTree rec {
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
          default = clanlib;
        };
      }
    );
}
