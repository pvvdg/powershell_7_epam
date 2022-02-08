# 1.	����ந�� PowerShell Remoting, ��� �ࠢ����� �ᥬ� ����㠫�묨 ��設��� � ��⮢��.

# �믮���� Enable-PSRemoting -Force � powershell � �ࠢ��� ����������� �� ��� �� � ����� ��� �����������. ��᫥ �⮣�:
# ?	��������� �㦡� WinRM (�᫨ ����饭� ��१��������),
# ?	�㦡� WinRM ��३��� � ���ﭨ� ? ��⮬���᪨� ����� �� ����,
# ?	�㤥� ᮧ��� ����訢�⥫� WinRM ��� HTTP ��䨪� �� ����� 5985 ��� ��� �������� IP ���ᮢ,
# ?	�㤥� ᮧ���� �ࠢ��� 䠩ࢮ�� ��� ����訢�⥫� WinRM.

# ��᫥ �⮣� �㦭� ࠧ���� ����������� � 㤠������ ��設� �� ��設� � ���ன �㤥� �ந�室��� �ࠢ�����, �믮���� ������� 
# set-item wsman:localhost\client\trustedhosts -value * - ���뢠�� ����� ��� ���
# set-item wsman:localhost\client\trustedhosts ?value "srv1,srv2" - ���뢠�� ����� ��� srv1,srv2 ��� ip

# 2.	�஢���� ࠡ��ᯮᮡ����� PS Remoting ��⠭���� 㤥���� ���� � ����� �� 㤠������ �������஢ � ����稢 ᯨ᮪ �⥢�� ���ன�� 㤥�񭭮�� ��������.
Param(
    [string]$Name
)
$user = "petrachukvv"

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "$Name"
Enter-PSSession -ComputerName $Name -Credential $user
