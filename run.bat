REM Copy the domain-join script to the 'C:'
xcopy /v /I "%~dp0DomainScript.ps1" "C:\"

REM Copy the domain-join wrapper to 'Startup' so it'll run on the next login.
xcopy /v /I "%~dp0runDomainScript.bat" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

REM Start the powershell script to take the computer out of the domain.
powershell -ExecutionPolicy ByPass -File %~dp0WorkgroupScript.ps1

PAUSE