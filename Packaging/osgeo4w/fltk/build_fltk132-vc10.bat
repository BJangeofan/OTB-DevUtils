@echo off

::\build_fltk13-vc10.bat \fltk-1.3.2\src \fltk-1.3.2\build-vc10 \fltk-1.3.2\install

call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\Tools\vsvars32.bat"

set /A ARGS_COUNT=0    
for %%A in (%*) do set /A ARGS_COUNT+=1  
if %ARGS_COUNT% NEQ 3 (goto :Usage)

if NOT DEFINED OSGEO4W_ROOT (goto :NoOSGEO4W)

set src_dir=%1
set build_dir=%2
set install_dir=%3
set current_dir=%CD%

set LANG=C

cmake -E remove_directory %build_dir%
cmake -E make_directory %build_dir%

cmake -E remove_directory %install_dir%
cmake -E make_directory %install_dir%

cd %build_dir%
cmake   %src_dir% ^
        -G "Visual Studio 10" ^
        -DCMAKE_LIBRARY_PATH:PATH="%OSGEO4W_ROOT%\lib" ^
        -DCMAKE_INCLUDE_PATH:PATH="%OSGEO4W_ROOT%\include" ^
        -DOPTION_BUILD_SHARED_LIBS:BOOL=ON ^
        -DOPTION_BUILD_EXAMPLES:BOOL=OFF ^
        -DCMAKE_INSTALL_PREFIX:PATH=%install_dir% ^
        -DLIB_png:FILEPATH="%OSGEO4W_ROOT%\lib\libpng13.lib" ^
        -DPNG_NAMES:STRING="libpng13" ^
        -DJPEG_LIBRARY:FILEPATH="%OSGEO4W_ROOT%\lib\jpeg_i.lib" ^
        -DLIB_jpeg:FILEPATH="%OSGEO4W_ROOT%\lib\jpeg_i.lib" ^
        -DZLIB_LIBRARY:FILEPATH="%OSGEO4W_ROOT%\lib\zlib.lib" ^
        -DLIB_zlib:FILEPATH="%OSGEO4W_ROOT%\lib\zlib.lib" ^
        -DCMAKE_CONFIGURATION_TYPES:STRING=Release;RelWithDebInfo

cmake --build . --config Release --target INSTALL

cd %current_dir%

goto :END

:Usage
echo You need to provide 3 arguments to the script: 
echo   1. path to the source directory
echo   2. path to the build directory (an empty directory)
echo   3. path to the installation directory (an empty directory)
GOTO :END

:NoOSGEO4W
echo You need to run this script from an OSGeo4W shell
GOTO :END

:END
