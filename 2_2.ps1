# 1.	Настроить PowerShell Remoting, для управления всеми виртуальными машинами с хостовой.

# Выполняю Enable-PSRemoting -Force в powershell с правами администратора на всех ВМ к которым буду подключаться. После этого:
# ?	запустится служба WinRM (если запущена перезапустится),
# ?	служба WinRM перейдет в состояние ? автоматический запуск при старте,
# ?	будет создан прослушиватель WinRM для HTTP трафика на порту 5985 для всех локальных IP адресов,
# ?	будет создано правило файрвола для прослушивателя WinRM.

# После этого нужно разрешить подключаться к удаленной машине на машине с которой будет происходить управление, выполнив команду 
# set-item wsman:localhost\client\trustedhosts -value * - открывает доступ для всех
# set-item wsman:localhost\client\trustedhosts ?value "srv1,srv2" - открывает доступ для srv1,srv2 или ip

# 2.	Проверить работоспособность PS Remoting установив уделённую сессию с каждым из удаленных компьютеров и получив список сетевых устройств уделённого компьютера.
Param(
    [string]$Name
)
$user = "petrachukvv"

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "$Name"
Enter-PSSession -ComputerName $Name -Credential $user
