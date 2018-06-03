@echo off

set VARIABLES_FILE="upload_config\variables.bat"

if not exist %VARIABLES_FILE% goto FAIL

call %VARIABLES_FILE%

if !%_7ZIP%! == "" if !%URL%! == "" goto FAIL

%_7ZIP% a index.htm.gz index.htm

curl -F "file=@index.htm.gz" %URL%

GOTO :EOF

:FAIL

echo Variables not set!
pause