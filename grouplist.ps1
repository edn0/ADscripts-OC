# Ce script à pour but de lister les groupes dont fait partie un utilisateur.

# Cette commande va demander à l'utilisateur le nom de la personne dont il souhaite connaitre les groupes
$nom = Read-host "Entrez le nom de l'utilisateur"

# Cette commande va prendre le nom donné par l'utilisateur et chercher les groupes dont il est membre
Get-ADuser $nom -properties MemberOf | Export-Csv ListeUtilisateursgroupeAD.csv -Encoding UTF8
