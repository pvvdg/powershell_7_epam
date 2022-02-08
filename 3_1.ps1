# 1.	�� ����� Invoke-Command � ��ࠬ��� ScriptBlock ������� ᯨ᮪ ࠡ����� ����ᮢ � �������� ����� 
# ������� (�।���⥫쭮 �� 㤠������ �� �������� �������).

Param(
    $Name
)
$user = "PC"
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $Name
Get-Item WSMan:\localhost\Client\TrustedHosts

Invoke-Command -ComputerName $Name -Credential $user -ScriptBlock { Get-Process | Format-Table ; Get-Process 'notepad' | Stop-Process }
