# Ce script a pour but de lister les utilisateurs d'un groupe et d'exporter cette liste
# version 1.2
# Auteur : Corentin Blondiau
# Utilisation : ./getgroupmembers.ps1 -group "nom du groupe"

# Ici je crée le paramètre "group"
param([Parameter(mandatory=$true)][string]$group)

# Cette commande va chercher les membres du groupe donné
Get-ADgroupmember $group | select name > utilisateurs$group.txt

Read-Host "L'export des membres du groupe $group est terminé."
