@echo off

if [%1]==[] goto noArgs
if [%2]==[] goto noArgs

cd Migrations

set ASPNETCORE_ENVIRONMENT=%1
set mig_name=%2

echo ASPNETCORE_ENVIRONMENT = %ASPNETCORE_ENVIRONMENT%
echo Migration name = %mig_name%

echo Restoring dotnet tools
dotnet tool restore

echo Creating migration
dotnet ef migrations add %mig_name%

cd ..

pause
goto :eof

:noArgs
echo Error! [2] argument(s) are required

pause
