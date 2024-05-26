{
  description = "ClanLib game SDK development files";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          default = clanlib;

          clanlib = pkgs.stdenv.mkDerivation {
            pname = "clanlib";
            version = "1.0.0";

            src = nixpkgs.lib.cleanSource ./.;

            enableParallelBuilding = true;

            preConfigure = "./autogen.sh";

            nativeBuildInputs = with pkgs; [
              autoconf
              automake
              gcc
              libtool
              perl
              pkg-config
            ];

            buildInputs = with pkgs; [
              SDL
              SDL_gfx
              alsa-lib
              libjpeg
              libmikmod
              libogg
              libpng
              libvorbis
              xorg.libXi
              xorg.libXmu
              xorg.libXxf86vm
            ];

            propagatedBuildInputs = with pkgs; [
              xorg.xorgproto
              xorg.libX11
              libGL
              libGLU
            ];
          };
        };
      }
    );
}
