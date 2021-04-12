# Ce script Ã  pour but de lister les groupes dont fait partie un utilisateur.

# Cette commande va demander Ã  l'utilisateur le nom de la personne dont il souhaite connaitre les groupes
$nom = Read-host "Entrez le nom de l'utilisateur"

# Cette commande va prendre le nom donnÃ© par l'utilisateur et chercher les groupes dont il est membre
dsquery user -samid $nom | dsget user -memberof | dsget group -samid > groupes$nom.txt

Read-Host "L'export s'est terminé sans encombres"
