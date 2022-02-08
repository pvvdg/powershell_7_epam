# 1.	При помощи Invoke-Command и параметра ScriptBlock получить список работающих процессов и завершить процесс 
# блокнота (предварительно на удаленном ПК запустить блокнот).

Param(
    $Name
)
$user = "PC"
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $Name
Get-Item WSMan:\localhost\Client\TrustedHosts

Invoke-Command -ComputerName $Name -Credential $user -ScriptBlock { Get-Process | Format-Table ; Get-Process 'notepad' | Stop-Process }
