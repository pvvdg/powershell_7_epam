# 1.	�� ����� WMI ��१���㧨�� �� (��� �� ���) ����㠫�� ��設�.

$names = @("192.168.134.169", "192.168.134.170")

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "$($names[0]),$($names[1])"
$user = Get-Credential
Get-WmiObject Win32_OperatingSystem -ComputerName $names -Credential $user | Invoke-WmiMethod -Name Reboot
