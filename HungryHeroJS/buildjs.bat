@echo off

setlocal


set CURRENTDIR=%cd%

set REPOS=%CURRENTDIR%\..\common
rem Randori Compiler Path

set RC=%REPOS%\randori-compiler-latest
rem sdk-path
set RSDK=%REPOS%\randori-sdk

rem Kontiki Source
set KONTIKISOURCE=%REPOS%\KontikiJS\src
rem Starling-Framework Source

set STARLINGROOT=%REPOS%\Starling-Framework\starling\src
rem Source File Base Path
set SOURCE=./
rem Output folder

set OUTPUT=..\js-randori

cd src


java -jar "%RC%\randori.jar" randori.compiler.clients.Randori -sdk-path "%RSDK%" -source-path "%KONTIKISOURCE%" -source-path "%STARLINGROOT%" -source-path "%SOURCE%" -js-classes-as-files=true -output "%OUTPUT%"