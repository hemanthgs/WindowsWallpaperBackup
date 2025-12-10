@echo off
setlocal enabledelayedexpansion

set count=0
set CurrentDir=%CD%

:: 1. Get date using PowerShell (Format: yyyy-MM-dd)
for /f %%a in ('powershell -Command "Get-Date -format yyyyMMdd_hhmmss"') do set "Today=%%a"

:: 2. Add the prefix
set MyFile=Pic
set PrefixedFile=%Today%_%MyFile%

echo The prefix filename is: %PrefixedFile%

C:
cd C:\Users\heman\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
FOR %%i IN (*) DO (
  echo "Copying %%i --> %PrefixedFile%_!count!.jpg"
  copy %%i "%CurrentDir%\%PrefixedFile%_!count!.jpg" > nul
 
  if %ERRORLEVEL% NEQ 0 (
    echo FAILED: Error code: %ERRORLEVEL%
    echo ----------------------------------
  ) else ( 
    echo SUCCESSFUL: Copied
    echo ----------------------------------
  )
 
 :: Increment the variable by 1
 set /a count=!count!+1
)

pause 
