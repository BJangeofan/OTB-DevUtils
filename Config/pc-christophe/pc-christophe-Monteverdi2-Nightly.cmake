#set (ENV{DISPLAY} ":0.0")

# Avoid non-ascii characters in tool output.
#set(ENV{LC_ALL} C)

set (CTEST_BUILD_CONFIGURATION "Release")
SET (CTEST_DASHBOARD_ROOT "/home/otbtesting")
SET (CTEST_SOURCE_DIRECTORY "${CTEST_DASHBOARD_ROOT}/sources/orfeo/trunk/Monteverdi2/")
SET (CTEST_BINARY_DIRECTORY "${CTEST_DASHBOARD_ROOT}/build/orfeo/trunk/Monteverdi2/")
set (CTEST_CMAKE_GENERATOR  "Unix Makefiles")
set (CTEST_CMAKE_COMMAND "cmake" )
set (CTEST_BUILD_COMMAND "/usr/bin/make -j4 -i -k" )
set (CTEST_SITE "pc-christophe.cst.cnes.fr" )
set (CTEST_BUILD_NAME "Fedora22-64bits-${CTEST_BUILD_CONFIGURATION}")
set (CTEST_HG_COMMAND "/usr/bin/hg")
set (CTEST_HG_UPDATE_OPTIONS "-C")
set (CTEST_USE_LAUNCHERS ON)

set(INSTALLROOT "${CTEST_DASHBOARD_ROOT}/install")

set (CTEST_INITIAL_CACHE "
BUILD_TESTING:BOOL=ON
BUILDNAME:STRING=${CTEST_BUILD_NAME}

CMAKE_BUILD_TYPE:STRING=${CTEST_BUILD_CONFIGURATION}
CMAKE_C_FLAGS:STRING=-Wall -Wno-uninitialized 
CMAKE_CXX_FLAGS:STRING=-Wall -Wno-deprecated -Wno-uninitialized
CTEST_USE_LAUNCHERS:BOOL=ON
OTB_DATA_USE_LARGEINPUT:BOOL=ON
OTB_DATA_ROOT:STRING=${CTEST_DASHBOARD_ROOT}/sources/orfeo/OTB-Data
OTB_DATA_LARGEINPUT_ROOT:STRING=/media/TeraDisk2/LargeInput
OTB_DIR:STRING=${CTEST_DASHBOARD_ROOT}/build/orfeo/trunk/OTB-Nightly/${CTEST_BUILD_CONFIGURATION}
ITK_DIR:PATH=${CTEST_DASHBOARD_ROOT}/build/itk/stable/${CTEST_BUILD_CONFIGURATION}

#otbIce
ICE_INCLUDE_DIR:PATH=${INSTALLROOT}/orfeo/trunk/Ice/${CTEST_BUILD_CONFIGURATION}/include/
ICE_LIBRARY:FILEPATH=${INSTALLROOT}/orfeo/trunk/Ice/${CTEST_BUILD_CONFIGURATION}/lib/libOTBIce.so

#Qwt
QWT_INCLUDE_DIR:PATH=/usr/include/qwt5-qt4
QWT_LIBRARY:FILEPATH=/usr/lib64/libqwt.so.5

SITE:STRING=${CTEST_SITE}
")

set (CTEST_NOTES_FILES
${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}
${CTEST_BINARY_DIRECTORY}/CMakeCache.txt
)

ctest_empty_binary_directory (${CTEST_BINARY_DIRECTORY})

ctest_start (Nightly)
ctest_update (SOURCE "${CTEST_SOURCE_DIRECTORY}")
file (WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" ${CTEST_INITIAL_CACHE})
ctest_configure (BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_read_custom_files (${CTEST_BINARY_DIRECTORY})
ctest_build (BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_test (BUILD "${CTEST_BINARY_DIRECTORY}" PARALLEL_LEVEL 4)
ctest_submit ()
