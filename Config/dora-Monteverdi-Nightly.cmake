SET( CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE )
SET(BUILDNAME "dora-testDriver-Release" CACHE STRING "" FORCE)
SET( OTB_DIR "/ORFEO/otbval/OTB-NIGHTLY-VALIDATION/testDriver-linux-shared-release-itk-internal-fltk-internal/binaries/OTB" CACHE PATH "" FORCE )
SET( OTB_DATA_ROOT "/ORFEO/otbval/WWW.ORFEO-TOOLBOX.ORG-CS-NIGHTLY/OTB-Data" CACHE PATH "" FORCE )
SET(OTB_DATA_USE_LARGEINPUT ON CACHE BOOL "" FORCE)
SET(OTB_DATA_LARGEINPUT_ROOT "/home2/data/OTB-Data-LargeInput" CACHE PATH "" FORCE)
SET( BUILD_TESTING "ON" CACHE BOOL "" FORCE )
SET( CMAKE_C_FLAGS " -Wall  -Wno-uninitialized -Wno-unused-variable" CACHE STRING "" FORCE )
SET( CMAKE_CXX_FLAGS " -Wall -Wno-deprecated -Wno-uninitialized -Wno-unused-variable" CACHE STRING "" FORCE )
SET( MAKECOMMAND "/usr/bin/make -i -k -j 4" CACHE PATH "" FORCE )
SET(GDAL_INCLUDE_DIR "/ORFEO/otbval/OTB-OUTILS/gdal/install-linux/include" CACHE PATH "" FORCE)
SET(GDAL_LIBRARY "/ORFEO/otbval/OTB-OUTILS/gdal/install-linux/lib/libgdal.so" CACHE PATH "" FORCE)