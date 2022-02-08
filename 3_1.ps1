# 1.	При помощи Invoke-Command и параметра ScriptBlock получить список работающих процессов и завершить процесс 
# блокнота (предварительно на удаленном ПК запустить блокнот).

Param(
    [string]$Name
)
$user = "petrachukvv"

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "$Name"

$NamesArray = $Names.Split(",")

foreach ($Name in $NamesArray) {
    Enter-PSSession -ComputerName $Name -Credential $user

}