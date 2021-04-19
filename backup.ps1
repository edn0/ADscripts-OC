# Ce script à pour but de faire une sauvegarde quotidienne des données de chaque poste client dans un dossier partagé sur le serveur
# Le dossier contenant les vidéos ne sera pas backup par soucis de stockage
# version 0.3
# Auteur : Corentin Blondiau

# Cette commande va faire une copie complète des documents de tout les dossiers utilisateur vers le serveur
Copy-item -path C:\Users\*\Documents\ -Destination \\WYM\Sauvegarde\ -recurse
Copy-item -path C:\Users\*\Téléchargements\ -Destination \\WYM\Sauvegarde\ -recurse
Copy-item -path C:\Users\*\Images\ -Destionation \\WYM\Sauvegarde\ -recurse
