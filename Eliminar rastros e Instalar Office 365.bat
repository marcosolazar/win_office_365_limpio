@echo off
rem Creado por Marcos Olazar para Soporte GTI (8/6/2024)
color 0F
net use z: /PERSISTENT:YES \\fs-soporte\Soporte > NUL 2>&1

set scriptDir=%~dp0

:office365
echo ----------------------------------------
echo  Nucleoelectrica Argentina - Office 365
echo ----------------------------------------
echo [1] Desinstalar cualquier paquete Office
echo [2] Instalar Microsoft Office 365
echo ----------------------------------------
set /p var=
if "%var%"=="1" goto :desinstalar
if "%var%"=="2" goto :ins365
if "%var%"=="3" goto :final
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
set /p var=
if /I "%var%"=="s" (
    net use /del z: > NUL
    shutdown -r -t 0
    exit /b
) else if /I "%var%"=="n" (
    goto :finalfinal
) else (
    echo Opcion erronea, presione cualquier tecla para continuar...
    pause > nul
    goto :final
)

:finalfinal
net use /del z: > NUL
exit /b
