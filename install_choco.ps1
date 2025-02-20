# Définir la politique d'exécution des scripts
Set-ExecutionPolicy Bypass -Scope Process -Force

# Activer le protocole TLS 1.2 si nécessaire
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Télécharger et exécuter le script d’installation Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Vérifier l'installation
choco --version
