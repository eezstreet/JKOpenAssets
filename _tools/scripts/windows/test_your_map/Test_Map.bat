:: Place Test_Map.bat and 7za.exe in the GameData folder
:: This script make a .pk3 with the needed files and also launch jedi academy with devmap your_map
@echo off
title Test_Map.pk3

:Map_Name

cls
echo.
echo ---------------
echo Enter the map name without .bsp,
echo example to launch test_map.bsp located in maps/OpenJK/mp/ just type : OpenJK/mp/test_map,
echo you can also launch original map like mp/ffa2.
echo ---------------
echo.

:Start

set /p map=Map name: 
Set map=%map:\=/%
cls

:Choose

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
set /p Choice=Your choice : 
echo.
echo.
if not %Choice%=='' set Choice=%Choice:~0,1%
if %Choice%==1 goto Original
if %Choice%==2 goto Test_Map
if %Choice%==3 goto Map_Name
if %Choice%==q exit
cls
echo  %Choice% Is invalid
echo.
echo.
goto Choose

:Test_Map

cd Base

	if not exist maps/%map%.bsp (
		cls
		echo.
		echo Invalid map name %map%, no bsp found
		echo.
		cd ..
		goto Start
	) else (
		del /F /S /Q Test_Map.pk3
		start /wait ../7za a Test_Map.zip maps/%map%.bsp
		ren Test_Map.zip Test_Map.pk3
		cd ..
	)

:Original

	if exist openjk.x86.exe (
		openjk.x86.exe +set fs_homepath . +devmap %map%
		exit
	) else (
		jamp.exe +devmap %map%
		exit
	)