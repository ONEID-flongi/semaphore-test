# Récupérer les variables d’environnement de Semaphore
$hosts = $env:WIN_HOSTS -split ","
$username = $env:WIN_USERNAME
$password = ConvertTo-SecureString $env:WIN_PASSWORD -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($username, $password)

# Exécuter le script sur chaque machine
foreach ($host in $hosts) {
    Write-Host "Déploiement de Chocolatey sur $host..."
    Invoke-Command -ComputerName $host -Credential $cred -ScriptBlock {
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        choco --version
    }
}
