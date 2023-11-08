@echo off
cls
echo Choose a Wi-Fi Access Point Configuration:
echo 1. Home (SSID: AmarahLouizeDC)
echo 2. Work (SSID: Management AP)
set /p choice=Enter the number (home or work) for your choice: 

if "%choice%"=="home" (
    netsh wlan add profile filename="C:\networkprofile\Wi-Fi-AmarahLouizeDC.xml" user=all
    netsh wlan connect name="AmarahLouizeDC" ssid="AmarahLouizeDC"
    netsh interface ip set address name="Wi-Fi" static 192.168.100.96 255.255.255.0 192.168.100.1
) else if "%choice%"=="work" (
    netsh wlan add profile filename="C:\networkprofile\Wi-Fi-Management AP.xml" user=all
    netsh wlan connect name="Management AP" ssid="Management AP"
    netsh interface ip set address name="Wi-Fi" static 192.168.20.96 255.255.255.0 192.168.20.1
) else (
    echo Invalid choice. No changes made.
)

pause