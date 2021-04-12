# Ce script à pour but de lister les utilisateurs d'un groupe
# version 1.0
# Auteur : Corentin Blondiau

# Cette commande va permettre d'obtenir aurpès de l'utilisateur le nom du groupe dont il souhaite connaitre les membres
$group = read-host "Entrez le nom du groupe dont vous souhaitez connaitre les utilisateurs"

# Cette commande va chercher les membres du groupe donné
Get-ADgroupmember $group > utilisateurs$group.txt

Read-Host "L'export des membres du groupe $group est terminee."
