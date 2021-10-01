@echo off
cls
set /p hostname=Entrez le nom du poste dont vous recherchez l'adresse IP:  

echo.
echo Choisissez le site: 
Echo [1] pour le site d'Avignon
Echo [2] pour Tarare Cantubas
Echo [3] pour Tarare Plateforme 
Echo [4] pour Herbignac 
echo.

set /p site=Choix du site: 

if '%site%'=='1' goto :choix1
if '%site%'=='2' goto :choix2
if '%site%'=='3' goto :choix3
if '%site%'=='4' goto :choix4

:choix1
ping -n 1 "%hostname%.avignon.grpldc.com"
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 "%hostname%.avignon.grpldc.com"') do set "ip=%%a"
goto :end

:choix2
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 "%hostname%.cantubas.grpldc.com"') do set "ip=%%a"
goto :end

:choix3
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 "%hostname%.tarare.grpldc.com"') do set "ip=%%a"
goto :end

:choix4
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 "%hostname%.herbignac.grpldc.com"') do set "ip=%%a"
goto :end

pause

:end
start "" "C:\Program Files\UltraVNC\vncviewer.exe" "%ip%:55900"

