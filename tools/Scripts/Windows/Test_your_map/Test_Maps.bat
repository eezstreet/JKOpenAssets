:: Place Test_Maps.bat and 7za.exe in the GameData folder
:: This script make a .pk3 with the needed files and also launch jedi academy with devmap your_map
@echo off
title your_test_map.pk3
:Map_Name
cls
echo.
echo ---------------
set /p map=Enter the map name (without .bsp, example to launch test_map.bsp located in maps/OpenJK/mp/ just type : OpenJK/mp/test_map, you can also launch original map like mp/ffa2):
Set map=%map:\=/%
cls
:choose
echo.
echo map is %map% :
echo.
echo ---------------
echo  1 : Original map (like mp/ffa2 or downloaded map)
echo ---------------
echo  2 : I test my map
echo ---------------
echo  3 : Change map's name
echo ---------------
echo  q : Exit
echo ---------------
echo.
echo.
set /p utile=Your choice : 
echo.
echo.
if not %utile%=='' set utile=%utile:~0,1%
if %utile%==1 goto Originals
if %utile%==2 goto Test_Map
if %utile%==3 goto Map_Name
if %utile%==q goto exit
cls
echo  %utile% Is invalid
echo.
echo.
goto choose
:Test_Map
cd Base
del Test_Maps.pk3
start /wait ../7za a Test_Maps.zip maps/%map%.bsp
ren Test_Maps.zip Test_Maps.pk3
cd ..
:Originals
if exist openjk.x86.exe (
openjk.x86.exe +set fs_homepath . +devmap %map%
exit
) else (
jamp.exe +devmap %map%
exit
)
:exit
exit