# 1.	�� ����� Invoke-Command � ��ࠬ��� ScriptBlock ������� ᯨ᮪ ࠡ����� ����ᮢ � �������� ����� 
# ������� (�।���⥫쭮 �� 㤠������ �� �������� �������).

Param(
    [string]$Name
)
$user = "petrachukvv"

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "$Name"

$NamesArray = $Names.Split(",")

foreach ($Name in $NamesArray) {
    Enter-PSSession -ComputerName $Name -Credential $user

}