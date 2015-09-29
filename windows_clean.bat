@ECHO OFF
:: A batch file that cleans cjdns
:: a really cool networking-type thing.
ECHO.

:start
SET START_DIR="%cd%"
cd /D %~dp0
cd
goto :welcome

:welcome
echo:
echo ** CJDNS Windows MSVC 'clean' Script **
echo:
echo this script was written by da2ce7
echo please feel free to report bugs on github.
echo:
goto :git



:git
pwd

git reset --hard HEAD
git clean -ffxd -e cjdroute.conf

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