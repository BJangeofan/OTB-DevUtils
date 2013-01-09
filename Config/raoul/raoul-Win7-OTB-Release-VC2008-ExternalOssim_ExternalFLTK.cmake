SET (CTEST_SOURCE_DIRECTORY "C:/Users/jmalik/Dashboard/src/OTB")
SET (CTEST_BINARY_DIRECTORY "C:/Users/jmalik/Dashboard/build/OTB-Release-VC2008-ExternalOssim-ExternalFLTK")

SET (CTEST_CMAKE_GENERATOR  "Visual Studio 9 2008" )
SET (CTEST_CMAKE_COMMAND "C:/Program Files (x86)/CMake 2.8/bin/cmake.exe")
SET (CTEST_SITE "raoul.c-s.fr" )
SET (CTEST_BUILD_NAME "Win7-Visual2008-Release-Static-ExternalFLTK13")
SET (CTEST_BUILD_CONFIGURATION "Release")
SET (CTEST_HG_COMMAND "C:/Program Files (x86)/Mercurial/hg.exe")
#SET (CTEST_HG_UPDATE_OPTIONS "-C")

SET (OTB_INITIAL_CACHE "
BUILDNAME:STRING=${CTEST_BUILD_NAME}
SITE:STRING=${CTEST_SITE}
CMAKE_INSTALL_PREFIX:PATH=C:/Users/jmalik/Dashboard/install/OTB-Release-VC2008-ExternalFltk
CMAKE_CONFIGURATION_TYPES:STRING=Release

BUILD_TESTING:BOOL=OFF
BUILD_EXAMPLES:BOOL=OFF
BUILD_APPLICATIONS:BOOL=ON

OTB_USE_CPACK:BOOL=OFF

OTB_USE_EXTERNAL_BOOST:BOOL=OFF
OTB_USE_MAPNIK:BOOL=OFF

OTB_DATA_ROOT:STRING=C:/Users/jmalik/Dashboard/src/OTB-Data
OTB_DATA_USE_LARGEINPUT:BOOL=ON
OTB_DATA_LARGEINPUT_ROOT:PATH=C:/Users/jmalik/Dashboard/src/OTB-LargeInput

OTB_USE_EXTERNAL_OSSIM:BOOL=ON
#OSSIM_INCLUDE_DIR:PATH=C:/Users/jmalik/Dashboard/install/ossim-trunk/include
#OSSIM_LIBRARY:FILEPATH=C:/Users/jmalik/Dashboard/install/ossim-trunk/lib/ossim.lib

OTB_USE_CURL:BOOL=ON
OTB_USE_EXTERNAL_EXPAT:BOOL=ON
OTB_USE_LIBLAS:BOOL=ON
OTB_USE_EXTERNAL_LIBLAS:BOOL=ON

OTB_USE_GETTEXT:BOOL=OFF
OTB_USE_JPEG2000:BOOL=ON

#OTB_WRAP_PYTHON:BOOL=ON
#OTB_WRAP_JAVA:BOOL=ON
#OTB_WRAP_QT:BOOL=ON
#OTB_WRAP_PYQT:BOOL=ON

OTB_USE_EXTERNAL_FLTK:BOOL=ON
FLTK_DIR:PATH=C:/Users/jmalik/Dashboard/install/fltk-1.3.0/CMake

SWIG_EXECUTABLE:FILEPATH=C:/OSGeo4W/apps/swigwin/swig.exe

PYTHON_EXECUTABLE:FILEPATH=C:/OSGeo4W/bin/python.exe
PYTHON_INCLUDE_DIR:PATH=C:/OSGeo4W/apps/Python27/include
PYTHON_LIBRARY:FILEPATH=C:/OSGeo4W/apps/Python27/libs/python27.lib
")

#remove build dir
ctest_empty_binary_directory (${CTEST_BINARY_DIRECTORY})

SET (CTEST_NOTES_FILES
${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}
${CTEST_BINARY_DIRECTORY}/CMakeCache.txt
)

ctest_start(Experimental)
ctest_update(SOURCE "${CTEST_SOURCE_DIRECTORY}")
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" ${OTB_INITIAL_CACHE})
ctest_configure (BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_read_custom_files(${CTEST_BINARY_DIRECTORY})
ctest_build (BUILD "${CTEST_BINARY_DIRECTORY}"
             TARGET INSTALL)
ctest_test (BUILD "${CTEST_BINARY_DIRECTORY}" PARALLEL_LEVEL 4)
ctest_submit ()
