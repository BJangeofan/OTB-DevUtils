
SET (CTEST_SOURCE_DIRECTORY "/mnt/dd-2/OTB/trunk/OTB-Nightly/")
SET (CTEST_BINARY_DIRECTORY "/mnt/dd-2/OTB/OTB-Binary-Coverage/")


# which ctest command to use for running the dashboard
SET (CTEST_COMMAND 
  "ctest -j4 -D Nightly -A /mnt/dd-2/OTB/trunk/OTB-DevUtils/Config/pc-grizonnetm-OTB-Coverage.cmake -V"
  )

# what cmake command to use for configuring this dashboard
SET (CTEST_CMAKE_COMMAND 
  "cmake"
  )

# should ctest wipe the binary tree before running
SET (CTEST_START_WITH_EMPTY_BINARY_DIRECTORY TRUE)

# this is the initial cache to use for the binary tree, be careful to escape
# any quotes inside of this string if you use it
SET (CTEST_INITIAL_CACHE "
//Command used to build entire project from the command line.
MAKECOMMAND:STRING=/usr/bin/make -i -k -j6
//Name of the build
BUILDNAME:STRING=Ubuntu9.10-64bits-Debug
//Name of the computer/site where compile is being run
SITE:STRING=pc-grizonnetm
//Data root
OTB_DATA_ROOT:STRING=/mnt/dd-2/OTB/trunk/OTB-Data
OTB_DATA_LARGEINPUT_ROOT:STRING=/mnt/dd-2/OTB/trunk/OTB-Data/LargeInput
//Compilation options
CMAKE_C_FLAGS:STRING= -Wall -fprofile-arcs -ftest-coverage
CMAKE_CXX_FLAGS:STRING= -Wall -fprofile-arcs -ftest-coverage
CMAKE_EXE_LINKER:STRING= -fprofile-arcs -ftest-coverage
//Set up the build options
CMAKE_BUILD_TYPE:STRING=Debug
BUILD_TESTING:BOOL=ON
BUILD_EXAMPLES:BOOL=ON
OTB_DATA_USE_LARGEINPUT:BOOL=ON
OTB_USE_CURL:BOOL=ON
OTB_USE_PQXX:BOOL=ON
OTB_USE_EXTERNAL_BOOST:BOOL=ON
OTB_USE_EXTERNAL_EXPAT:BOOL=ON
USE_FFTWD:BOOL=ON
USE_FFTWF:BOOL=ON
OTB_GL_USE_ACCEL:BOOL=ON 
ITK_USE_REVIEW:BOOL=ON 
ITK_USE_OPTIMIZED_REGISTRATION_METHODS:BOOL=ON 
OTB_USE_MAPNIK:BOOL=ON 
MAPNIK_INCLUDE_DIR:STRING=/usr/include
MAPNIK_LIBRARY:STRING=/usr/lib/libmapnik.so
//Set GDAL options
GDAL_CONFIG:STRING=/home/grizonnetm/Local/gdal-1.6.3-build/bin/gdal-config
GDAL_INCLUDE_DIR:STRING=/home/grizonnetm/Local/gdal-1.6.3-build/include
GDAL_LIBRARY:STRING=/home/grizonnetm/Local/gdal-1.6.3-build/lib/libgdal.so
OGR_INCLUDE_DIRS:STRING=/home/grizonnetm/Local/gdal-1.6.3-build/include
")

# set any extra envionment varibles here
SET (CTEST_ENVIRONMENT
 "DISPLAY=:0"
)
