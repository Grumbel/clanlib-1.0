;; ClanLib SDK
;; Copyright (c) 2019 Ingo Ruhnke <grumbel@gmail.com>
;;
;; This software is provided 'as-is', without any express or implied
;; warranty.  In no event will the authors be held liable for any damages
;; arising from the use of this software.
;;
;; Permission is granted to anyone to use this software for any purpose,
;; including commercial applications, and to alter it and redistribute it
;; freely, subject to the following restrictions:
;;
;; 1. The origin of this software must not be misrepresented; you must not
;;    claim that you wrote the original software. If you use this software
;;    in a product, an acknowledgment in the product documentation would be
;;    appreciated but is not required.
;; 2. Altered source versions must be plainly marked as such, and must not be
;;    misrepresented as being the original software.
;; 3. This notice may not be removed or altered from any source distribution.

(set! %load-path
  (cons* "/ipfs/QmUnzfxrKWTapKvTaGcux6Bb6cTP9ChWy1JxVVvPQYSw78/guix-cocfree_0.0.0-54-g6e9f20d"
         %load-path))

(use-modules (guix build-system gnu)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (gnu packages linux)
             (gnu packages autotools)
             (gnu packages gl)
             (gnu packages perl)
             (gnu packages pkg-config)
             (gnu packages image)
             (gnu packages sdl)
             (gnu packages xiph)
             (gnu packages xorg)
             (guix-cocfree utils))

(define %source-dir (dirname (current-filename)))

(define-public clanlib-1.0
  (package
   (name "clanlib-1.0")
   (version (version-from-source %source-dir))
   (source (source-from-source %source-dir))
   (build-system gnu-build-system)
   (native-inputs
    `(("autoconf" ,autoconf)
      ("automake" ,automake)
      ("libtool" ,libtool)
      ("pkg-config" ,pkg-config)
      ("perl" ,perl)))
   (inputs
    `(("libpng" ,libpng)
      ("libjpeg" ,libjpeg)
      ("sdl" ,sdl)
      ("sdl-gfx" ,sdl-gfx)
      ("libmikmod" ,libmikmod)
      ("libvorbis" ,libvorbis)
      ("libogg" ,libogg)
      ("libxi" ,libxi)
      ("libxmu" ,libxmu)
      ("alsa-lib" ,alsa-lib)
      ("mesa" ,mesa)
      ("glu" ,glu)))
   (synopsis "ClanLib game SDK development files")
   (description "ClanLib is a multi-platform software development kit,
with an emphasis on game development.

On one side, it tries to provide a platform independent interface to
write games with, by taking over the low-level work from the game and
providing wrappers around toolkits such as DirectFB, DirectX, OpenGL,
Vorbis, X11, etc., so that if a game is written with ClanLib, the game
should compile on any platform supported by ClanLib without changing
its source code.

On the other hand, ClanLib also tries to be a service-minded SDK.  In
other words, the developers have put great effort into designing the
API, to ensure ClanLib's ease of use - while maintaining its power.")
   (home-page "https://gitlab.com/grumbel/clanlib-1.0/")
   (license license:zlib)))

clanlib-1.0

;; EOF ;;
