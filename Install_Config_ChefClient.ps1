<#	.Description
	Run this script from a Chef Workstation to interactively install Chef Client to server
	and register it with the Chef server.
	Accept following parameters to configure the client to its proper Environment and Role
	i) Client.rb
	ii)Organization-Validator.pem
	iii)Chef Server Certificate Folder structure to default Path

	.INPUTS
	none

	.Example
	chef-client -c C:\Chef\client.rb

	.Outputs
	Logging to sessoin and written to c:\chef\logs\ (the Chef client Log)
#>

Write-Host "To manage a Client system through OpsCode Chef, we need to install client and register with Chef Server"
$nodeName = Read-Host -Prompt "Enter Server FQDN "
Write-Host "Checking if Server is accessible..." -ForegroundColor Green
While(!(Test-Connection $nodeName)){
	Write-Host "Server is not accessible, please check and re-enter server FQDN" -ForegroundColor Red
	$nodeName = Read-Host -Prompt "Enter Server FQDN "
}

Write-Host "Checking if Server has WinRM installed and configured" -ForegroundColor Green 
$winrmchk = winrm get winrm/config/winrs -r:$nodeName
if([string]::IsNullOrEmpty($winrmchk)){
	Write-Host "WinRM is not installed and configured" -ForegroundColor Green 
	Write-Host "Installing and Configuring WinRM" -ForegroundColor Green
	pushd C:\Windows\System32
	psexec.exe -accepteula \\$nodeName -s -d powershell.exe "Enable-PSRemoting -Force"
	popd	
}
##IN PROGRESS##


