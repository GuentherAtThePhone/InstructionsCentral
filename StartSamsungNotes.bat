@echo off

:: Überprüfen, ob das Skript als Administrator ausgeführt wird
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Administratorrechte erforderlich. Neustart mit Admin-Rechten...
    powershell -command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Auslesen des gesamten Wertes von SystemProductName und Speichern in der Variablen "SystemProductName"
for /f "tokens=3* delims= " %%A in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v SystemProductName') do set "SystemProductName=%%A %%B"

:: Auslesen des gesamten Wertes von SystemManufacturer und Speichern in der Variablen "SystemManufacturer"
for /f "tokens=3* delims= " %%A in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v SystemManufacturer') do set "SystemManufacturer=%%A %%B"


:: Ausgabe der gespeicherten Werte
echo SystemProductName: %SystemProductName%
echo SystemManufacturer: %SystemManufacturer%

reg add "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v SystemProductName /t REG_SZ /d "NP940XMA-KB1DE" /f
reg add "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v SystemManufacturer /t REG_SZ /d "Samsung" /f

start shell:Appsfolder\SAMSUNGELECTRONICSCoLtd.SamsungNotes_wyx1vj98g3asy!App

timeout /t 4

reg add "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v SystemProductName /t REG_SZ /d "%SystemProductName%" /f
reg add "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v SystemManufacturer /t REG_SZ /d "%SystemManufacturer%" /f
