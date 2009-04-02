SET( CMAKE_BUILD_TYPE "Release" CACHE STRING "debianRelease" FORCE )
SET( OTB_DIR "/home/otbtesting/OTB/OTB-Binary-Nightly" CACHE STRING "debianRelease" FORCE )
SET( OTB_DATA_ROOT "/home/christop/OTB/trunk/OTB-Data" CACHE STRING "debianRelease" FORCE )
SET( BUILD_TESTING "ON" CACHE STRING "debianRelease" FORCE )
SET( OTB_USE_VTK "ON" CACHE STRING "debianRelease" FORCE )
SET( CMAKE_C_FLAGS " -Wall  -Wno-uninitialized -Wno-unused-variable" CACHE STRING "debianRelease" FORCE )
SET( CMAKE_CXX_FLAGS " -Wall -Wno-deprecated -Wno-uninitialized -Wno-unused-variable" CACHE STRING "debianRelease" FORCE )
SET( CMAKE_EXE_LINKER " " CACHE STRING "debianRelease" FORCE )
SET( MAKECOMMAND "/usr/bin/make -i -j 8" CACHE STRING "debianRelease" FORCE )

SET( CMAKE_INSTALL_PREFIX "/home/otbtesting/OTB/tmp" CACHE STRING "Used for package generation" FORCE )
SET( OTB_USE_CPACK ON CACHE BOOL "Use CPack" FORCE )
SET( CPACK_BINARY_DEB ON CACHE BOOL "Generate debian package" FORCE )
SET( CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64" CACHE STRING "Debian Architecture" FORCE)