# Ce script à pour but de lister les groupes dont fait partie un utilisateur.
# version 1.0
# Auteur : Corentin Blondiau

# Création du paramètre nom et je le rends obligatoire
param([Parameter(mandatory=$true)][string]$nomutilisateur)

# Cette commande va prendre le nom donné par l'utilisateur et chercher les groupes dont il est membre
dsquery user -samid $nomutilisateur | dsget user -memberof | dsget group -samid > groupes$nomutilisateur.txt

Read-Host "L'export s'est terminé sans encombres"
