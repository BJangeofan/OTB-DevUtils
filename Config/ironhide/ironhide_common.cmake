# Client maintainer: julien.malik@c-s.fr
foreach(req
    OTB_PROJECT
    OTB_ARCH
    )
  if(NOT DEFINED ${req})
    message(FATAL_ERROR "The containing script must set ${req}")
  endif()
endforeach()

if (NOT DEFINED dashboard_model)
  set(dashboard_model Nightly)
endif()

if (NOT DEFINED CTEST_DASHBOARD_ROOT)
set(CTEST_DASHBOARD_ROOT "C:/Users/rashad/Dashboard")
endif()

file(TO_CMAKE_PATH $ENV{OSGEO4W_ROOT} OSGEO4W_ROOT)
message("OSGEO4W_ROOT is ${OSGEO4W_ROOT}")

if (NOT DEFINED CTEST_SITE)
set(CTEST_SITE "ironhide.c-s.fr" )
endif()

if (NOT DEFINED CTEST_CMAKE_GENERATOR)
if (${OTB_ARCH} STREQUAL "x86")
  #set(CTEST_CMAKE_GENERATOR  "Visual Studio 10" )
  set(CTEST_CMAKE_GENERATOR "NMake Makefiles")
  #set(CTEST_CMAKE_GENERATOR "Ninja")
elseif(${OTB_ARCH} STREQUAL "amd64")
  #set(CTEST_CMAKE_GENERATOR  "Visual Studio 10 Win64" )
  set(CTEST_CMAKE_GENERATOR "NMake Makefiles")
  #set(CTEST_CMAKE_GENERATOR "Ninja")
endif()
endif()
# switch to Ninja builders instead of Visual Studio projects
if (NOT DEFINED dashboard_build_command)
  set(dashboard_build_command "nmake")
endif()

if (NOT DEFINED CTEST_TEST_ARGS)
set(CTEST_TEST_ARGS PARALLEL_LEVEL 4)
endif()

if (NOT DEFINED CTEST_TEST_TIMEOUT)
set(CTEST_TEST_TIMEOUT 1500)
endif()

set(CTEST_GIT_COMMAND $ENV{GIT})
set(CTEST_CMAKE_COMMAND $ENV{CMAKE})
# set(CTEST_HG_COMMAND "C:/Program Files (x86)/Mercurial/hg.exe")

# build a shorted binary path (OTB needs source and binary paths < 50)
if (${OTB_ARCH} STREQUAL "x86")
  set(OTB_ARCH_SHORT  "32b" )
elseif(${OTB_ARCH} STREQUAL "amd64")
  set(OTB_ARCH_SHORT  "64b" )
endif()

if(${CTEST_BUILD_CONFIGURATION} STREQUAL "Release")
  set(BUILD_CONF_SHORT "Rel")
elseif(${CTEST_BUILD_CONFIGURATION} STREQUAL "Debug")
  set(BUILD_CONF_SHORT "Dbg")
elseif(${CTEST_BUILD_CONFIGURATION} STREQUAL "RelWithDebInfo")
  set(BUILD_CONF_SHORT "RDI")
endif()

if (NOT DEFINED dashboard_fresh_source_checkout)
set(dashboard_fresh_source_checkout OFF)
endif()
