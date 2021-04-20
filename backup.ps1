# Ce script à pour but de faire une sauvegarde quotidienne des données de chaque poste client dans un dossier partagé sur le serveur
# Le dossier contenant les vidéos ne sera pas backup par soucis de stockage
# version 0.3
# Auteur : Corentin Blondiau

foreach ($username in Get-Content \\WVM\Partage\usr.txt){

# Cette commande va définir le chemin
$src = "C:\Users\" + $username + "\Documents\"
$Destination = "\\WVM\Sauvegardes\$username\"

# Cette commande va faire une copie complête des documents de tout les dossiers utilisateur vers le serveur
robocopy $src $Destination /MIR /w:0 /r:0 /XF desktop.ini
}
