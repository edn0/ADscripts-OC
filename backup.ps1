# Ce script à pour but de faire une sauvegarde quotidienne des données de chaque poste client dans un dossier partagé sur le serveur
# version 0.1
# Auteur : Corentin Blondiau

Copy-item -path C:\Users\$env:UserName\Documents\ -Destination \\WVM\Sauvegardes\$env:UserName\ -recurse

