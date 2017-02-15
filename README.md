# Install_Config_ChefClient
Installing and configuring Chef Client from WorkStation
This script is to help installation of Chef Client in an interactive way on
Target systems.
It will do a check if the Target Node exists in network and can be contacted from Chef WorkStation.
It will also check, if Target Node has WinRM configured(Currently, this is only for Windows Servers).
Script will configure WinRM in case it is not configured on Target. I will use PSEXEC to do it remotely.
