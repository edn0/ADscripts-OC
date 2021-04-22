# Ce script à pour but de faire une sauvegarde quotidienne des données de chaque poste client dans un dossier partagé sur le serveur
# Le dossier contenant les vidéos ne sera pas backup par soucis de stockage
# version 0.9
# Auteur : Corentin Blondiau

# Cette commande va récupérer les noms d'utilisateurs dans un fichier texte afin d'avoir tout les noms à disposition.
## sugg : ajouter une commande pour pull de nouveau les username, l'exporter dans ce même usr.txt afin de toujours avoir les noms à jour
foreach ($username in Get-Content \\WVM\Partage\usr.txt){

# Cette commande va définir le chemin du dossier à copier, puis sa destination
$src = "C:\Users\" + $username + "\Documents\"
$Destination = "\\WVM\SAV\$username\"

# Cette commande va faire une copie complête des documents de tout les dossiers utilisateur vers le serveur.
# Il est nécessaire d'exclure desktop.ini avec /XF pour que la copie des dossiers système tels que Documents soit bien enregistré au nom de l'utilisateur dans la destination. Autrement le dossier était appelé "Documents". Problème connu de robocopy lorsque l'on fait une copie des dossiers système utilisateur.
robocopy $src $Destination /MIR /w:0 /r:0 /XF desktop.ini
}
