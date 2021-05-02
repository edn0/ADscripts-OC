# Ce script à pour but de faire une sauvegarde quotidienne du dossier Doucments de chaque utilisateur s'étant connecté sur le poste
# version 1.3
# Auteur : Corentin Blondiau

# Cette commande va lister les dossiers dans le dossier Utilisateurs
$dir = Get-ChildItem C:\Users

# Ici je récupère le nom de chaque dossier avec une confirmation visuelle via Write-Host
$dir | ForEach-Object{
Write-Host "ok"
write $_.FullName

# Cette commande va définir le chemin du dossier à copier, puis sa destination. Je vais prendre le nom de la machine pour éviter d'écraser les données dans le cas où l'utilisateur s'est servi de plusieurs postes.
$src = $_.FullName + "\Documents"
$username = $_.name
$machine = $env:COMPUTERNAME
$Destination = "\\WVM\Sauvegardes\$username\$machine"

# Je teste si le chemin existe, si non, je vais forcer sa création
if(!(test-path $destination)){
  try{
New-Item -item-type directory -force -path $destination
}
catch{
  Write-Host "Le dossier destination n'a pas pu être crée"
  }
  try{
# Cette commande va faire une copie complête des documents de tout les dossiers utilisateur vers le serveur.
# Il est nécessaire d'exclure desktop.ini avec /XF pour que la copie du dossier Documents soit bien enregistrée au nom de l'utilisateur dans la destination. Autrement le dossier était appelé "Documents" avec l'icône du dossier personnel Documents. Problème connu de robocopy lorsque l'on fait une copie des dossiers personnels utilisateur.
robocopy $src $Destination /MIR /w:0 /r:0 /XF desktop.ini
}
catch {
  Write-Host "La copie du dossier n'a pas pu être effectuée"
}
