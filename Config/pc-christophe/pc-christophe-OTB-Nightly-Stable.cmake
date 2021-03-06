# Client maintainer: manuel.grizonnet@cnes.fr
set(dashboard_model Nightly)
set(OTB_PROJECT OTB)
set(CTEST_BUILD_CONFIGURATION Release)
set(CTEST_BUILD_NAME "Fedora22-64bits-Stable-${CTEST_BUILD_CONFIGURATION}")
include(${CTEST_SCRIPT_DIRECTORY}/pc-christophe_common.cmake)
include(${CTEST_SCRIPT_DIRECTORY}/../config_stable.cmake)

string(TOLOWER ${dashboard_model} lcdashboard_model)

set(dashboard_root_name "tests")
set(dashboard_source_name "sources/orfeo/trunk/OTB-Nightly")
set(dashboard_binary_name "build/orfeo/trunk/OTB-Nightly-Stable/${CTEST_BUILD_CONFIGURATION}")

#set(dashboard_fresh_source_checkout TRUE)
set(dashboard_git_url "http://git@git.orfeo-toolbox.org/git/otb.git")

set(INSTALLROOT "${CTEST_DASHBOARD_ROOT}/install")
set (OTB_INSTALL_PREFIX "${INSTALLROOT}/orfeo/trunk/OTB-Nightly-Stable/${CTEST_BUILD_CONFIGURATION}")

macro(dashboard_hook_init)

# NOTE: -Wno-deprecated-declarations is in CXX flags to hide 'itkLegacyMacro' related warning
# under gcc 5.1.1, to work around GCC bug 65974.
# It should be removed when gcc is updated on pc-christophe

set(dashboard_cache "${dashboard_cache}

CMAKE_C_FLAGS:STRING=-Wall -Wextra
CMAKE_CXX_FLAGS:STRING=-Wall -Wno-cpp -Wextra -Wno-deprecated-declarations
CMAKE_INSTALL_PREFIX:PATH=${OTB_INSTALL_PREFIX}

BUILD_TESTING:BOOL=ON
BUILD_EXAMPLES:BOOL=ON

OTB_DATA_USE_LARGEINPUT:BOOL=ON
OTB_DATA_LARGEINPUT_ROOT:STRING=/media/TeraDisk2/LargeInput
OTB_DATA_ROOT:STRING=${CTEST_DASHBOARD_ROOT}/sources/orfeo/OTB-Data

## ITK
ITK_DIR:PATH=/home/otbtesting/build/itk/stable/Release

## OSSIM
OSSIM_INCLUDE_DIR:PATH=${INSTALLROOT}/ossim/master/include
OSSIM_LIBRARY:FILEPATH=${INSTALLROOT}/ossim/master/lib64/libossim.so

##external muparserx
MUPARSERX_LIBRARY:PATH=${INSTALLROOT}/muparserx/stable/lib/libmuparserx.so
MUPARSERX_INCLUDE_DIR:PATH=${INSTALLROOT}/muparserx/stable/include/muparserx

#external openjpeg
OpenJPEG_DIR:PATH=${INSTALLROOT}/openjpeg/stable/lib/openjpeg-2.1

PYTHON_EXECUTABLE:FILEPATH=/usr/bin/python
OTB_WRAP_PYTHON:BOOL=ON
OTB_WRAP_JAVA:BOOL=ON

#OTB_USE_XXX
OTB_USE_6S=ON
OTB_USE_CURL=ON
OTB_USE_LIBKML=OFF
OTB_USE_LIBSVM=ON
OTB_USE_MAPNIK:BOOL=OFF
OTB_USE_MUPARSER:BOOL=ON
OTB_USE_MUPARSERX:BOOL=ON
OTB_USE_OPENCV:BOOL=ON
OTB_USE_OPENJPEG=ON
OTB_USE_QT4=ON
OTB_USE_SIFTFAST=ON
# Ice module
OTB_USE_OPENGL:BOOL=ON
OTB_USE_GLEW:BOOL=ON
OTB_USE_GLFW:BOOL=ON
OTB_USE_GLUT:BOOL=ON
 ")

endmacro()

#remove install dir
execute_process(COMMAND ${CTEST_CMAKE_COMMAND} -E remove_directory ${OTB_INSTALL_PREFIX})
execute_process(COMMAND ${CTEST_CMAKE_COMMAND} -E make_directory ${OTB_INSTALL_PREFIX})

include(${CTEST_SCRIPT_DIRECTORY}/../otb_common.cmake)
