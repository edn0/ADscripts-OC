# Ce script à pour but de faire une sauvegarde quotidienne des données de chaque poste client dans un dossier partagé sur le serveur
# version 0.2
# Auteur : Corentin Blondiau

# Cette commande va faire une copie complète des documents de tout les dossiers utilisateur vers le serveur
Copy-item -path C:\Users\*\Documents\ -Destination \\WYM\Sauvegarde\ -recurse
Copy-item -path C:\Users\*\Téléchargements\ -Destination \\WYM\Sauvegarde\ -recurse


## usr/*/DOcuments + telechargements + images...
