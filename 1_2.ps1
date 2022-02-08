# 2.	При помощи WMI просмотреть список запущенных служб на удаленном компьютере.

$names = @("192.168.134.169")
$user = Get-Credential
Get-WmiObject Win32_Service -ComputerName $names -Credential $user | Where-Object { $_.State -eq "Running" } | Format-Table