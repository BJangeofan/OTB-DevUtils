SET (CTEST_SOURCE_DIRECTORY "$ENV{HOME}/Projets/otb/nightly/src/OTB")
SET (CTEST_BINARY_DIRECTORY "$ENV{HOME}/Projets/otb/nightly/binaries/release/OTB")

set( CTEST_CMAKE_GENERATOR  "Unix Makefiles" )

SET (CTEST_CMAKE_COMMAND "cmake" )

SET (CTEST_BUILD_COMMAND "/usr/bin/make -j4  -i -k install" )

SET (CTEST_SITE "PC8413-ubuntu9.10")

SET (CTEST_BUILD_NAME "Ubuntu9.10-32bits-Release")

SET (CTEST_BUILD_CONFIGURATION "Release")

SET (CTEST_HG_COMMAND "/usr/bin/hg")
SET (CTEST_HG_UPDATE_OPTIONS "-C")

SET (CTEST_INITIAL_CACHE "
BUILDNAME:STRING=${CTEST_BUILD_NAME}
SITE:STRING=${CTEST_SITE}

OTB_DATA_USE_LARGEINPUT:BOOL=ON
OTB_DATA_LARGEINPUT_ROOT:STRING=$ENV{HOME}/Projets/otb/src/OTB-LargeInput
OTB_DATA_ROOT:STRING=$ENV{HOME}/Projets/otb/src/OTB-Data

CMAKE_C_FLAGS:STRING= -Wall -Wno-uninitialized -Wno-unused-variable
CMAKE_CXX_FLAGS:STRING= -Wall -Wno-deprecated -Wno-uninitialized -Wno-unused-variable

CMAKE_BUILD_TYPE:STRING=Release
BUILD_TESTING:BOOL=ON
BUILD_EXAMPLES:BOOL=ON

OTB_USE_CURL:BOOL=ON
OTB_USE_PQXX:BOOL=OFF
OTB_USE_EXTERNAL_BOOST:BOOL=ON
OTB_USE_EXTERNAL_EXPAT:BOOL=ON
OTB_USE_EXTERNAL_FLTK:BOOL=ON
FLTK_DIR:PATH=$ENV{HOME}/Utils/build/fltk-1.1
USE_FFTWD:BOOL=OFF
USE_FFTWF:BOOL=OFF
OTB_GL_USE_ACCEL:BOOL=OFF
ITK_USE_REVIEW:BOOL=ON 
ITK_USE_OPTIMIZED_REGISTRATION_METHODS:BOOL=ON 
OTB_USE_MAPNIK:BOOL=OFF
CMAKE_INSTALL_PREFIX:STRING=$ENV{HOME}/Projets/otb/nightly/install/OTB

GDALCONFIG_EXECUTABLE:FILEPATH=$ENV{HOME}/Utils/bin/gdal-1.7.2/bin/gdal-config
GDAL_CONFIG:FILEPATH=$ENV{HOME}/Utils/bin/gdal-1.7.2/bin/gdal-config
GDAL_INCLUDE_DIR:STRING=$ENV{HOME}/Utils/bin/gdal-1.7.2/include
GDAL_LIBRARY:FILEPATH=$ENV{HOME}/Utils/bin/gdal-1.7.2/lib/libgdal.so
OGR_INCLUDE_DIRS:PATH=$ENV{HOME}/Utils/bin/gdal-1.7.2/include
GEOTIFF_INCLUDE_DIRS:PATH=$ENV{HOME}/Utils/src/gdal-1.7.2/frmts/gtiff/libgeotiff
TIFF_INCLUDE_DIRS:PATH=$ENV{HOME}/Utils/src/gdal-1.7.2/frmts/gtiff/libtiff
JPEG_INCLUDE_DIRS:PATH=$ENV{HOME}/Utils/src/gdal-1.7.2/frmts/jpeg/libjpeg
JPEG_INCLUDE_DIR:PATH=$ENV{HOME}/Utils/src/gdal-1.7.2/frmts/jpeg/libjpeg
")

SET (CTEST_ENVIRONMENT
 "DISPLAY=:0"
)

SET( PULL_RESULT_FILE "${CTEST_BINARY_DIRECTORY}/pull_result.txt" )

SET (CTEST_NOTES_FILES
${CTEST_BINARY_DIRECTORY}/CMakeCache.txt
${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}
${PULL_RESULT_FILE}
)

ctest_empty_binary_directory (${CTEST_BINARY_DIRECTORY})

execute_process( COMMAND ${CTEST_HG_COMMAND} pull http://hg.orfeo-toolbox.org/OTB-Nightly
                 WORKING_DIRECTORY "${CTEST_SOURCE_DIRECTORY}"
                 OUTPUT_VARIABLE   PULL_RESULT
                 ERROR_VARIABLE    PULL_RESULT )
file(WRITE ${PULL_RESULT_FILE} ${PULL_RESULT} )

ctest_start(Nightly)
ctest_update(SOURCE "${CTEST_SOURCE_DIRECTORY}")
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" ${CTEST_INITIAL_CACHE})
ctest_configure (BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_build (BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_test (BUILD "${CTEST_BINARY_DIRECTORY}" PARALLEL_LEVEL 2)
ctest_submit ()

