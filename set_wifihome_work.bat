@echo off
cls
echo Choose a Wi-Fi Access Point Configuration:
echo 1. Home (SSID: YourWifiID1)
echo 2. Work (SSID: YourWifiID2)
set /p choice=Enter the number (home or work) for your choice: 

if "%choice%"=="home" (
    netsh wlan add profile filename="C:\networkprofile\Wi-Fi-YourWifiID1.xml" user=all
    netsh wlan connect name="YourWifiID1" ssid="YourWifiID1"
    netsh interface ip set address name="Wi-Fi" static 192.168.xx.xx255.255.255.0 192.168.xx.xx
) else if "%choice%"=="work" (
    netsh wlan add profile filename="C:\networkprofile\Wi-Fi-YourWifiID2.xml" user=all
    netsh wlan connect name="YourWifiID2" ssid="YourWifiID2"
    netsh interface ip set address name="Wi-Fi" static 192.168.xx.xx 255.255.255.0 192.168.xx.xx
) else (
    echo Invalid choice. No changes made.
)

pause
