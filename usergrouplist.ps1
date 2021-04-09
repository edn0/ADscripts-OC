# Ce script à pour but de lister les groupes dont fait partie un utilisateur.

# Cette commande va demander à l'utilisateur le nom de la personne dont il souhaite connaitre les groupes
$nom = Read-host "Entrez le nom de l'utilisateur"

# Cette commande va prendre le nom donné par l'utilisateur et chercher les groupes dont il est membre
dsquery user -samid $nom | dsget user -memberof | dsget group -samid > grpliste.txt
