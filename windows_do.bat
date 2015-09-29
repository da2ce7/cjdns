@ECHO OFF
:: A batch file that compiles cjdns
:: a really cool networking-type thing.
ECHO.

:start
SET START_DIR="%cd%"
cd /D %~dp0
cd
goto :welcome

:welcome
echo:
echo ** CJDNS Windows MSVC 'do' Script **
echo:
echo this script was written by da2ce7
echo please feel free to report bugs on github.
echo:
goto :git



:git
pwd

git submodule update --init --recursive
git submodule foreach git clean -ffxd
git submodule foreach git reset --hard
xcopy /S/Q/Y node_build\dependencies\gyp  node_build\dependencies\libuv\build\gyp\

goto done:



:done
ECHO:
ECHO DONE!
ECHO:
goto :finish

:finish
cd /D %START_DIR%
pause
goto :eof