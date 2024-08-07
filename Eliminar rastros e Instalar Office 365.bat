@echo off
rem Creado por Marcos Olazar para Soporte GTI (8/6/2024)
color 0F
net use z: /PERSISTENT:YES \\fs-soporte\Soporte > NUL 2>&1

set scriptDir=%~dp0

:office365
echo ---------------------------------------------
echo    Nucleoelectrica Argentina - Office 365
echo ---------------------------------------------
echo [1] Desinstalar todos los paquetes existentes
echo [2] Instalar Microsoft Office 365
echo ---------------------------------------------
set /p var=
if "%var%"=="1" goto :desinstalar
if "%var%"=="2" goto :ins365
echo Opcion erronea, presione cualquier tecla para continuar...
pause > nul
goto :office365

:desinstalar
echo Ejecutando desinstalador de Office...
start /wait "Desinstalador Office" "%scriptDir%desinstalador_office.diagcab"
goto :ins365

:ins365
echo Instalando Office 365...
start /wait "Microsoft Office 365" "%scriptDir%OfficeSetup.exe"
goto :final


:final
echo ------------------------------------------------
echo Proceso finalizado, puede reiniciar su equipo...
echo ------------------------------------------------
