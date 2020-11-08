@echo off

FOR /F "tokens=3 delims= " %%G in ('reg query "hklm\system\controlset001\control\nls\language" /v Installlanguage') DO (
IF [%%G] EQU [0804] (
	set "CHN = true"
)
IF [%%G] EQU [0404] (
	set "CHN = true"
)  
)

if defined CHN  (chcp 65001)
CLS

if defined CHN (title Matrix驱动安装器 V1.0) else (title Matrix Driver Installer V1.0)
if defined CHN (echo Matrix驱动安装器 V1.0) else (echo Matrix Driver Installer V1.0)
echo.

if defined CHN (echo 安装Matrix固件升级模式驱动...) else (echo Installing Matrix DFU driver...)
"%~dp0wdi-simple" --vid 0x0203 --pid 0x0003 --type 1 --name "Matrix DFU" --dest "%~dp0matrix-dfu"
echo.

if defined CHN (echo 安装Matrix串口驱动...) else (echo Installing Matrix Serial driver...)
"%~dp0wdi-simple" --vid 0x0203 --pid 0x0004 --type 3 --name "Matrix Serial" --dest "%~dp0matrix-serial"
echo.

pause
