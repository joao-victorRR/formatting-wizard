@echo off
:: Verificar se o script está sendo executado com permissões de administrador
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    echo Este script precisa ser executado como Administrador.
    echo Reiniciando com permissões de administrador...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit
)


:: Título do script
title formatting wizard - IW

:: Menu inicial
:menu
cls
echo ============================================
echo            formatting wizard
echo powered by https://github.com/joao-victorRR
echo                06/12/2024
echo ============================================
echo -------------- Utilidades --------------
echo 1. Alterar plano de energia
echo 2. Ativar todos os processadores no msconfig
echo 3. Alterar nome de usuario e grupo do computador
echo 4. Alterar delay dos menus do Windows
echo.
echo -------------- Ativadores --------------
echo 5. Ativar o Windows (irm massgrave.dev)
echo.
echo -------------- Programas --------------
echo 6. Instalar Google Chrome
echo 7. Instalar pacote Office (Windows 10)
echo 8. Instalar WinRAR (Brasil)
echo 9. Instalar AnyDesk
echo 10. Instalar Adobe Reader
echo 11. Instalar TeamViewer
echo 12. Instalar Firefox
echo 13. Baixar AutoCAD 2025
echo 14. Baixar Photoshop 2024 (Windows 10 e 11)
echo 15. Baixar After Effects 2024 (Windows 10 e 11)
echo 16. Baixar Adobe Premiere Pro 2024 (Windows 10 Only)
echo.
echo 17. Sair
echo 18. Limpar pasta temp (extrema importancia apos instalacao de programas!)
echo.
set /p choice="Escolha uma opcao (1-17): "

if "%choice%"=="1" goto power_plan
if "%choice%"=="2" goto msconfig_advanced
if "%choice%"=="3" goto user_and_group
if "%choice%"=="4" goto change_menu_delay
if "%choice%"=="5" goto activate_windows
if "%choice%"=="6" goto install_chrome
if "%choice%"=="7" goto download_office
if "%choice%"=="8" goto install_winrar
if "%choice%"=="9" goto install_anydesk
if "%choice%"=="10" goto install_adobe_reader
if "%choice%"=="11" goto install_teamviewer
if "%choice%"=="12" goto install_firefox
if "%choice%"=="13" goto download_autocad
if "%choice%"=="14" goto download_photoshop
if "%choice%"=="15" goto download_aftereffects
if "%choice%"=="16" goto download_premierepro
if "%choice%"=="17" exit
if "%choice%"=="18" goto clean_temp
goto menu

:: Alterar plano de energia
:power_plan
cls
echo Alterando plano de energia para nunca desligar o monitor...
powercfg -change monitor-timeout-ac 0
powercfg -change monitor-timeout-dc 0
echo Plano de energia alterado com sucesso!
pause
goto menu

:: Ativar todos os processadores no msconfig
:msconfig_advanced
cls
echo Abrindo msconfig para configurar a inicializacao e usar todos os processadores...
start msconfig
echo Agora, voce deve ir em "Inicializacao do sistema" -> "Opcoes avancadas" e ativar "Numero de processadores".
echo Apos isso, clique em "OK" e reinicie o computador para aplicar as mudancas.
pause
goto menu

:: Alterar nome de usuario e grupo do computador
:user_and_group
cls
echo Abrindo as configuracoes para alterar o nome de usuario e o grupo do computador...
start sysdm.cpl
echo Agora, voce pode alterar o nome do computador na aba "Nome do Computador" e tambem ajustar as configuracoes de grupo.
pause
goto menu

:: Alterar delay dos menus do Windows
:change_menu_delay
cls
echo Alterando o delay dos menus do Windows para 0...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
echo O delay dos menus foi alterado para 0. Agora, os menus irao aparecer instantaneamente.
pause
goto menu

:: Ativar o Windows (irm massgrave.dev)
:activate_windows
cls
echo Ativando o Windows com o script de massgrave.dev...
powershell -Command "irm https://massgrave.dev/get | iex"
echo O comando foi executado. Siga as instrucoes do script para ativar o Windows.
pause
goto menu

:: Instalar Google Chrome
:install_chrome
cls
echo Baixando instalador do Google Chrome...
set "url=https://dl.google.com/chrome/install/ChromeStandaloneSetup64.exe"
set "installer=%TEMP%\ChromeInstaller.exe"
curl --output "%installer%" "%url%"
if exist "%installer%" (
    echo Instalador baixado com sucesso. Iniciando instalacao...
    start /b "" powershell -Command "Start-Process '%installer%' -Verb runAs"
    echo Google Chrome instalado com sucesso!
) else (
    echo Falha ao baixar o instalador do Google Chrome. Verifique o link.
)
pause
goto menu

:: Baixar pacote Office (Windows 10)
:download_office
cls
echo Baixando o pacote do Office para Windows 10...
set "url=https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365ProPlusRetail&platform=x64&language=pt-br&version=O16GA"
set "installer=%TEMP%\OfficeInstaller.exe"
curl --output "%installer%" "%url%"
if exist "%installer%" (
    echo Instalador baixado com sucesso. Iniciando instalacao...
    start /b "" powershell -Command "Start-Process '%installer%' -Verb runAs"
    echo Pacote Office instalado com sucesso!
) else (
    echo Falha ao baixar o pacote do Office. Verifique o link.
)
pause
goto menu

:: Instalar WinRAR (Brasil)
:install_winrar
cls
echo Baixando instalador do WinRAR...
set "url=https://www.rarlab.com/rar/winrar-x64-701br.exe"
set "installer=%TEMP%\WinRARInstaller.exe"
curl --output "%installer%" "%url%"
if exist "%installer%" (
    echo Instalador baixado com sucesso. Iniciando instalacao...
    start /b "" powershell -Command "Start-Process '%installer%' -Verb runAs"
    echo WinRAR instalado com sucesso!
) else (
    echo Falha ao baixar o instalador do WinRAR. Verifique o link.
)
pause
goto menu

:: Instalar AnyDesk
:install_anydesk
cls
echo Baixando instalador do AnyDesk...
set "url=https://anydesk.com/pt/downloads/thank-you?dv=win_exe"
set "installer=%TEMP%\AnyDeskInstaller.exe"
curl --output "%installer%" "%url%"
if exist "%installer%" (
    echo Instalador baixado com sucesso. Iniciando instalacao...
    start /b "" powershell -Command "Start-Process '%installer%' -Verb runAs"
    echo AnyDesk instalado com sucesso!
) else (
    echo Falha ao baixar o instalador do AnyDesk. Verifique o link.
)
pause
goto menu

:: Instalar Adobe Reader
:install_adobe_reader
cls
echo Baixando instalador do Adobe Reader...
set "url=https://get.adobe.com/br/reader/download?os=Windows+10&name=Reader+2024.003.20112+Brazilian+Windows%2864Bit%29&lang=br&nativeOs=Windows+10&accepted=&declined=mss&preInstalled=&site=landing"
set "installer=%TEMP%\AdobeReaderInstaller.exe"
curl --output "%installer%" "%url%"
if exist "%installer%" (
    echo Instalador baixado com sucesso. Iniciando instalacao...
    start /b "" powershell -Command "Start-Process '%installer%' -Verb runAs"
    echo Adobe Reader instalado com sucesso!
) else (
    echo Falha ao baixar o instalador do Adobe Reader. Verifique o link.
)
pause
goto menu

:: Instalar TeamViewer
:install_teamviewer
cls
echo Baixando instalador do TeamViewer...
set "url=https://dl.teamviewer.com/download/version_15x/TeamViewer_Setup_x64.exe?coupon=CMP-PR-BF24"
set "installer=%TEMP%\TeamViewerInstaller.exe"
curl --output "%installer%" "%url%"
if exist "%installer%" (
    echo Instalador baixado com sucesso. Iniciando instalacao...
    start /b "" powershell -Command "Start-Process '%installer%' -Verb runAs"
    echo TeamViewer instalado com sucesso!
) else (
    echo Falha ao baixar o instalador do TeamViewer. Verifique o link.
)
pause
goto menu

:: Instalar Firefox
:install_firefox
cls
echo Baixando instalador do Firefox...
set "url=https://download.mozilla.org/?product=firefox-stub&os=win&lang=pt-BR&attribution_code=c291cmNlPXd3dy5nb29nbGUuY29tJm1lZGl1bT1yZWZlcnJhbCZjYW1wYWlnbj0obm90IHNldCkmY29udGVudD0obm90IHNldCkmZXhwZXJpbWVudD0obm90IHNldCkmdmFyaWF0aW9uPShub3Qgc2V0KSZ1YT1lZGdlJmNsaWVudF9pZF9nYTQ9KG5vdCBzZXQpJnNlc3Npb25faWQ9KG5vdCBzZXQpJmRsc291cmNlPW1vem9yZw.."
set "installer=%TEMP%\FirefoxInstaller.exe"
curl --output "%installer%" "%url%"
if exist "%installer%" (
    echo Instalador baixado com sucesso. Iniciando instalacao...
    start /b "" powershell -Command "Start-Process '%installer%' -Verb runAs"
    echo Firefox instalado com sucesso!
) else (
    echo Falha ao baixar o instalador do Firefox. Verifique o link.
)
pause
goto menu

:: Baixar AutoCAD 2025
:download_autocad
cls
echo Abrindo o link de download do AutoCAD 2025 no navegador...
start "" "https://t.co/QB8vKVmavG"
echo O instalador do AutoCAD 2025 foi aberto no seu navegador. Por favor, faça o download e a instalação manualmente.
pause
goto menu

:: Baixar Photoshop 2024
:download_photoshop
cls
echo Abrindo o link de download do Photoshop 2024 no navegador...
start "" "https://drive.usercontent.google.com/download?id=1ZtJ-sZkwC7OSrQBsYfJ3oBwWOrENSMlI&export=download&authuser=0&confirm=t&uuid=6cc2510a-626e-43ad-aea4-bc07ab5d7c08&at=APvzH3rpmErqJxC31Sz5N5uuQqk5:1733538157637"
echo O instalador do Photoshop 2024 foi aberto no seu navegador. Por favor, faça o download e a instalação manualmente.
pause
goto menu

:: Baixar After Effects 2024
:download_aftereffects
cls
echo Abrindo o link de download do After Effects 2024 no navegador...
start "" "https://drive.usercontent.google.com/download?id=1DS8QXclMqJXCe6NCft7-RcwGHCj3zrWc&export=download&authuser=0&confirm=t&uuid=8b8533b8-ba9c-494e-8d2f-babdcb29ebc7&at=APvzH3rEU1V2epJK8uC07t4bLXb1:1733538379378"
echo O instalador do After Effects 2024 foi aberto no seu navegador. Por favor, faça o download e a instalação manualmente.
pause
goto menu

:: Baixar Adobe Premiere Pro 2024 (Windows 10 Only)
:download_premierepro
cls
echo Abrindo o link de download do Adobe Premiere Pro 2024 (Windows 10 Only) no navegador...
start "" "https://drive.usercontent.google.com/download?id=1yPzpo0DW6AHfVgZ9bx07QCEtxY7QjLmJ&export=download&authuser=0&confirm=t&uuid=be400682-b088-4892-ab75-e593b1f22b77&at=APvzH3qhQtpqBaZmqj7lKR0cM1sx:1733538982269"
echo O instalador do Adobe Premiere Pro foi aberto no seu navegador. Por favor, faça o download e a instalação manualmente.
pause
goto menu

:: Limpar pasta %temp%
:clean_temp
cls
echo Limpando a pasta %temp%...
del /q /f /s %temp%\*
echo Pasta %temp% limpa com sucesso!
pause
goto menu
