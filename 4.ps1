# 3.	Для одной из виртуальных машин установить для прослушивания порт 42658. Проверить работоспособность PS Remoting.

#На удаленной машине необходимо изменить порт слушателя
Set-Item WSMan:\localhost\Listener\\Port -Value 42658
#А также добавить правило в брандмауэре
$FirewallParam = @{
    DisplayName = 'Custom WinRM Port Rule'
    Direction   = 'Inbound'
    LocalPort   = '42658'
    Protocol    = 'TCP'
    Action      = 'Allow'
    Program     = 'System'
}
New-NetFirewallRule @FirewallParam

# При подключении на машину с измененным портом, необходимо его явно указать.
Enter-PSSession -ComputerName 192.168.47.138 -Credential PC -Port 42658