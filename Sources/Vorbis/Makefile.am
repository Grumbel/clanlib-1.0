lib_LTLIBRARIES = libclanVorbis.la

libclanVorbis_la_SOURCES = \
	setupvorbis.cpp \
	soundprovider_vorbis.cpp \
	soundprovider_vorbis_session.cpp

libclanVorbis_la_LIBADD = \
  ../Sound/libclanSound.la \
  ../Signals/libclanSignals.la \
  ../Core/libclanCore.la \
  -lvorbis -logg

libclanVorbis_la_LDFLAGS = \
  -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE) $(LDFLAGS_LT_RELEASE)

# EOF #
