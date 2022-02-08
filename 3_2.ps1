# 2.	Написать файл сценарий получения списка всех работающих служб. Выполнить сценарий на всех удалённых компьютерах одновременно.

Get-Content machines.txt | ForEach-Object { $string += $_ + ',' }
$string = $string.Substring(0, $string.Length - 1) 
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $string
Get-Item WSMan:\localhost\Client\TrustedHosts
$user = 'PC'
Invoke-Command -ComputerName (Get-Content Machines.txt) -Credential $user -ScriptBlock { Get-Service | Where-Object { $_.Status -eq "Running" } | Format-Table }
