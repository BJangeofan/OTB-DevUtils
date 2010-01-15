SET( SITE "pc-grizonnetm" CACHE STRING "ubuntuRelease" FORCE )
SET( CMAKE_BUILD_TYPE "Release" CACHE STRING "ubuntuRelease" FORCE )
SET( BUILD_TESTING ON CACHE BOOL "ubuntuRelease" FORCE )
SET( BUILD_EXAMPLES ON CACHE BOOL "ubuntuRelease" FORCE )
SET( OTB_USE_CURL ON CACHE BOOL "ubuntuRelease" FORCE )
SET( OTB_USE_PQXX ON CACHE BOOL "ubuntuRelease" FORCE)
SET( OTB_USE_EXTERNAL_BOOST ON CACHE BOOL "ubuntuRelease" FORCE )
SET( OTB_USE_EXTERNAL_EXPAT ON CACHE BOOL "ubuntuRelease" FORCE )
SET( OTB_USE_EXTERNAL_FLTK ON CACHE BOOL "ubuntuRelease" FORCE )
SET( USE_FFTWD ON CACHE BOOL "ubuntuRelease" FORCE )
SET( USE_FFTWF ON CACHE BOOL "ubuntuRelease" FORCE )
SET( OTB_DATA_ROOT "/mnt/sdb1/OTB/trunk/OTB-Data" CACHE STRING "ubuntuRelease" FORCE )
SET( OTB_DATA_USE_LARGEINPUT ON CACHE BOOL "ubuntuDebug" FORCE )
SET( OTB_DATA_LARGEINPUT_ROOT "/mnt/sdb1/OTB/trunk/LargeInput" CACHE STRING "ubuntuDebug" FORCE )
SET( CMAKE_C_FLAGS " -Wall -Wno-uninitialized -Wno-unused-variable" CACHE STRING "ubuntuRelease" FORCE )
SET( CMAKE_CXX_FLAGS " -Wall -Wno-deprecated -Wno-uninitialized -Wno-unused-variable" CACHE STRING "ubuntuRelease" FORCE )
SET( CMAKE_EXE_LINKER " " CACHE STRING "ubuntuRelease" FORCE )
SET( MAKECOMMAND "/usr/bin/make -i -k -j 8" CACHE STRING "ubuntuRelease" FORCE )
SET( OTB_GL_USE_ACCEL ON CACHE BOOL "ubuntuRelease" FORCE )
SET( ITK_USE_REVIEW ON CACHE BOOL "ubuntuRelease" FORCE )
SET( ITK_USE_OPTIMIZED_REGISTRATION_METHODS ON CACHE BOOL "Multithreaded registration" FORCE )

#SET( OTB_USE_MAPNIK ON CACHE BOOL "Using mapnik" FORCE)
#SET( MAPNIK_INCLUDE_DIR "/home/christop/slash/include" CACHE STRING "mapnik include" FORCE)
#SET( MAPNIK_LIBRARY "/home/christop/slash/lib64/libmapnik.so" CACHE STRING "mapnik lib" FORCE)

SET( OTB_USE_CPACK ON CACHE BOOL "Generate installer" FORCE )
SET( CMAKE_INSTALL_PREFIX "/mnt/sdb1/OTB/tmp" CACHE STRING "Used for package generation" FORCE )
SET( CPACK_BINARY_DEB ON CACHE BOOL "Generate ubuntu package" FORCE )
SET( CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64" CACHE STRING "debian Architecture" FORCE)
