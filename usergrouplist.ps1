# Ce script à pour but de lister les groupes dont fait partie un utilisateur.

# Création du paramètre nom et je le rends obligatoire
param([Parameter(mandatory=$true)][string]$nom)

# Cette commande va demander à l'utilisateur le nom de la personne dont il souhaite connaitre les groupes
$nom = Read-host "Entrez le nom de l'utilisateur"

# Cette commande va prendre le nom donné par l'utilisateur et chercher les groupes dont il est membre
dsquery user -samid $nom | dsget user -memberof | dsget group -samid > groupes$nom.txt

Read-Host "L'export s'est terminé sans encombres"
