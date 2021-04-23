# Ce script va permettre de créer des groupes au sein de l'AD en demandant à l'utilisateur d'entrer le nom du groupe à créer, le nombre d'utilisateurs à ajouter et quels sont ces utilisateurs


# Cette commande va demander le nom du groupe à créer
$groupe = read-host "Entrez le nom du groupe"
New-ADgroup $groupe -groupscope global

# Cette commande va demander le nombre d'utilisateur(s) à insérer dans le groupe
$nombre = read-host "Entrez le nombre d'utilisateur(s) que vous souhaitez inclure dans le groupe $groupe"

# Cette ligne va permettre une boucle afin de répéter la commande de demande du nom afin de pouvoir entrer plusieurs utilisateurs
for ($i=1; $i -le $nombre; $i++)
{

$nom = read-host "Entrez le(s) nom(s) de(s) (l')utilisateur(s) inclu(s) dans le groupe $groupe"

Add-ADgroupmember -identity $groupe -members $nom
Write-host "L'utilisateur $nom fait maintenant partie du groupe $groupe"
