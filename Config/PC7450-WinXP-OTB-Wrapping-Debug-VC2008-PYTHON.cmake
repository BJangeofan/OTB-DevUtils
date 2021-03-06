SET (CTEST_SOURCE_DIRECTORY "D:/Developpement/OTB-hg/OTB-Wrapping")
SET (CTEST_BINARY_DIRECTORY "D:/Developpement/OTB-NIGHTLY-VALIDATION/OSGEO-Release/binaries/OTB-Wrapping-Python-Debug")

SET (CTEST_CMAKE_GENERATOR  "Visual Studio 9 2008" )
SET (CTEST_CMAKE_COMMAND "C:/Program Files/CMake 2.8/bin/cmake.exe")
SET (CTEST_SITE "PC7450.c-s.fr" )
SET (CTEST_BUILD_NAME "WinXP-Visual2008Debug-Static-JAVA-OFF-PYTHON-ON")

SET (CTEST_BUILD_CONFIGURATION "Debug")

SET (CTEST_HG_COMMAND "C:/Program Files/Mercurial/hg.exe")
SET (CTEST_HG_UPDATE_OPTIONS "-C")

SET (OTB_INITIAL_CACHE "
BUILDNAME:STRING=${CTEST_BUILD_NAME}
SITE:STRING=${CTEST_SITE}

CMAKE_BUILD_TYPE:STRING=${CTEST_BUILD_CONFIGURATION}
CMAKE_CONFIGURATION_TYPES:STRING=${CTEST_BUILD_CONFIGURATION}

OTB_DATA_ROOT:STRING=D:/Developpement/OTB-hg/OTB-Data

GDAL_INCLUDE_DIR:PATH=C:/OSGeo4W/include

OTB_DIR:PATH=D:/Developpement/OTB-NIGHTLY-VALIDATION/OSGEO-Release/binaries/OTB-Debug
OTB_USE_CPACK:BOOL=ON

EXPAT_INCLUDE_DIR:PATH=C:/OSGeo4W/include
EXPAT_LIBRARY:FILEPATH=C:/OSGeo4W/lib/libexpat.lib

LIBLAS_INCLUDE_DIR:PATH=C:/OSGeo4W/include
LIBLAS_LIBRARY:FILEPATH=C:/OSGeo4W/lib/liblas_c.lib

# Utilitites for Wrapping
SWIG_DIR:PATH=D:/Developpement/OTB-OUTILS/swig/swigwin-1.3.40/Source/Swig
SWIG_EXECUTABLE:FILEPATH=D:/Developpement/OTB-OUTILS/swig/swigwin-1.3.40/swig.exe
CableSwig_DIR:PATH=D:/Developpement/OTB-OUTILS/cable_siwg/Cable-Swig-Bin

# OTB Test driver to launch the tests
OTB_TEST_DRIVER:FILEPATH=D:/Developpement/OTB-NIGHTLY-VALIDATION/OSGEO-Release/binaries/OTB-DEbug/bin/Debug/otbTestDriver.exe

# Java Stuffs
JAVA_JVM_LIBRARY:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/lib/jvm.lib
JAVA_INCLUDE_PATH:PATH=C:/Program Files/Java/jdk1.6.0_14/include
JAVA_INCLUDE_PATH2:PATH=C:/Program Files/Java/jdk1.6.0_14/include/win32
JAVA_AWT_INCLUDE:PATH=C:/Program Files/Java/jdk1.6.0_14/include
JAVA_RUNTIME:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/bin/java.exe
JAVA_COMPILE:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/bin/javac.exe
JAVA_ARCHIVE:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/bin/jar.exe
JAVA_MAXIMUM_HEAP_SIZE:PATH=1G

Java_JAR_EXECUTABLE:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/bin/jar.exe
Java_JAVAC_EXECUTABLE:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/bin/javac.exe
Java_JAVA_EXECUTABLE:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/bin/java.exe

JAVADOC_EXECUTABLE:FILEPATH=C:/Program Files/Java/jdk1.6.0_14/bin/javadoc.exe

#PYTHON_EXECUTABLE
PYTHON_EXECUTABLE:FILEPATH=C:/Python26/python.exe
PYTHON_LIBRARIES:PATH=C:/Python26/Lib
PYTHON_INCLUDE_DIRS:PATH=C:/Python26/include
PYTHON_LIBRARY:FILEPATH=C:/Python26/libs/python26.lib

# Select Languages to Wrap
WRAP_ITK_JAVA:BOOL=OFF
WRAP_ITK_PYTHON:BOOL=ON

")

ctest_empty_binary_directory (${CTEST_BINARY_DIRECTORY})

SET( OTB_PULL_RESULT_FILE "${CTEST_BINARY_DIRECTORY}/pull_result.txt" )
execute_process( COMMAND ${CTEST_HG_COMMAND} pull http://hg.orfeo-toolbox.org/OTB-Wrapping
                 WORKING_DIRECTORY "${CTEST_SOURCE_DIRECTORY}"
                 OUTPUT_VARIABLE   OTB_PULL_RESULT
                 ERROR_VARIABLE    OTB_PULL_RESULT )
file(WRITE ${OTB_PULL_RESULT_FILE} ${OTB_PULL_RESULT} )

SET (CTEST_NOTES_FILES
${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}
${CTEST_BINARY_DIRECTORY}/CMakeCache.txt
${OTB_PULL_RESULT_FILE}
)

ctest_start(Nightly)
ctest_update(SOURCE "${CTEST_SOURCE_DIRECTORY}")
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" ${OTB_INITIAL_CACHE})
ctest_configure (BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_read_custom_files(${CTEST_BINARY_DIRECTORY})
ctest_submit (PARTS Start Update Configure)
ctest_build (BUILD "${CTEST_BINARY_DIRECTORY}")
ctest_submit (PARTS Build)
ctest_test (BUILD "${CTEST_BINARY_DIRECTORY}" PARALLEL_LEVEL 4)
ctest_submit ()
