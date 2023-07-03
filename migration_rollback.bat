@echo off

if [%1]==[] goto noArgs

cd Migrations

set ASPNETCORE_ENVIRONMENT=%1

echo ASPNETCORE_ENVIRONMENT = %ASPNETCORE_ENVIRONMENT%

echo Restoring dotnet tools
dotnet tool restore

echo Removing last migration
dotnet ef migrations remove

cd ..

pause
goto :eof

:noArgs
echo Error! [1] argument(s) are required

pause