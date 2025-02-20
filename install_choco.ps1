# Définir la politique d'exécution pour éviter les restrictions
Set-ExecutionPolicy Bypass -Scope Process -Force

# Activer TLS 1.2 pour éviter les problèmes de connexion
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Télécharger et exécuter le script d’installation de Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Vérifier que Chocolatey est bien installé
choco --version
