# Client maintainer: julien.malik@c-s.fr
set(dashboard_model Experimental)
set(CTEST_DASHBOARD_ROOT "/home/otbval/Dashboard")
set(CTEST_SITE "pc8413.c-s.fr")
set(CTEST_BUILD_NAME "Ubuntu10.10-32bits-Debug")
set(CTEST_BUILD_CONFIGURATION Debug)
set(CTEST_CMAKE_GENERATOR "Eclipse CDT4 - Unix Makefiles")
set(CTEST_BUILD_COMMAND "/usr/bin/make -j4 -i -k" )
set(CTEST_TEST_ARGS PARALLEL_LEVEL 2)
set(CTEST_TEST_TIMEOUT 500)

set(dashboard_root_name "tests")
set(dashboard_source_name "src/ITKv4")
set(dashboard_binary_name "build/ITKv4-Debug")

set(dashboard_git_url "git://github.com/julienmalik/ITK.git")
set(dashboard_git_branch "WarpImageFilterForVectorImage")

macro(dashboard_hook_init)
  set(dashboard_cache "${dashboard_cache}
    BUILD_SHARED_LIBS:BOOL=ON
    BUILD_TESTING:BOOL=ON
    BUILD_EXAMPLES:BOOL=OFF
    ITK_BUILD_ALL_MODULES:BOOL=ON
    ITK_LEGACY_SILENT:BOOL=ON
    ITK_USE_REVIEW:BOOL=ON
    ITK_USE_CONCEPT_CHECKING:BOOL=ON
    ITKV3_COMPATIBILITY:BOOL=OFF
    ITK_USE_64BITS_IDS:BOOL=OFF
    ITK_COMPUTER_MEMORY_SIZE:STRING=16
    CMAKE_CXX_FLAGS:STRING=-fPIC -Wall -Wshadow -Wno-uninitialized -Wextra
    CMAKE_C_FLAGS:STRING=-fPIC -Wall -Wshadow -Wno-uninitialized -Wextra
    ")
endmacro()

include(${CTEST_SCRIPT_DIRECTORY}/itk_common.cmake)
