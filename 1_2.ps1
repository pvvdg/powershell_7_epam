# 2.	�� ����� WMI ��ᬮ���� ᯨ᮪ ����饭��� �㦡 �� 㤠������ ��������.

$names = @("192.168.134.169")
$user = Get-Credential
Get-WmiObject Win32_Service -ComputerName $names -Credential $user | Where-Object { $_.State -eq "Running" } | Format-Table