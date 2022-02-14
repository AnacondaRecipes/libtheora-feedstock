copy %RECIPE_DIR%\CMakeLists.txt .\CMakeLists.txt
copy %RECIPE_DIR%\libtheora.def .\libtheora.def

:: Make a build folder and change to it.
mkdir %SRC_DIR%\build
cd %SRC_DIR%\build

set BUILD_TYPE=Release
:: set BUILD_TYPE=RelWithDebInfo
:: set BUILD_TYPE=Debug

:: Configure using the CMakeFiles
cmake -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE:STRING=%BUILT_TYPE% ^
    -DBUILD_SHARED_LIBS=ON ^
   %SRC_DIR%
if errorlevel 1 exit \b 1

:: Build!
cmake --build . --config %BUILD_TYPE% --target install
if errorlevel 1 exit \b 1
