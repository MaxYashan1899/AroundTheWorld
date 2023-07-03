@echo off

if [%1]==[] goto noArgs
if [%2]==[] goto noArgs

cd Migrations

set ASPNETCORE_ENVIRONMENT=%1
set rollback_mig_name=%2

echo ASPNETCORE_ENVIRONMENT = %ASPNETCORE_ENVIRONMENT%
echo Rollback to Migration with name = %rollback_mig_name%

echo Restoring dotnet tools
dotnet tool restore

echo Rolling back database schema
dotnet ef database update %rollback_mig_name%

cd ..

pause
goto :eof

:noArgs
echo Error! [2] argument(s) are required

pause