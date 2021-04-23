# Ce script a pour but de lister les utilisateurs d'un groupe
# version 1.1
# Auteur : Corentin Blondiau

param([string]$group)

function check {
    if ($group -eq ""){
    $group = Read-host "Entrez le nom du groupe dont vous souhaitez connaitre les membres"
}
}

# Cette commande va permettre d'obtenir auprès de l'utilisateur le nom du groupe dont il souhaite connaitre les membres
$group = read-host "Entrez le nom du groupe dont vous souhaitez connaitre les utilisateurs"

# Cette commande va chercher les membres du groupe donné
Get-ADgroupmember $group | select name > utilisateurs$group.txt

Read-Host "L'export des membres du groupe $group est terminé."