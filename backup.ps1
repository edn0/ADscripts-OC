# Ce script à pour but de faire une sauvegarde quotidienne des donn�es de chaque poste client dans un dossier partag� sur le serveur
# Le dossier contenant les vid�os ne sera pas backup par soucis de stockage
# version 1.2
# Auteur : Corentin Blondiau

$username = Get-ChildItem C:\Users
$username | ForEach-Object{
write $_.name
}



# Cette commande va d�finir le chemin du dossier à copier, puis sa destination
$src = "C:\Users\" + $username + "\Documents\"
$Destination = "\\WVM\SAV\$username\"

# Cette commande va faire une copie compl�te des documents de tout les dossiers utilisateur vers le serveur.
# Il est n�cessaire d'exclure desktop.ini avec /XF pour que la copie des dossiers syst�me tels que Documents soit bien enregistr� au nom de l'utilisateur dans la destination. Autrement le dossier �tait appel� "Documents". Probl�me connu de robocopy lorsque l'on fait une copie des dossiers syst�me utilisateur.
robocopy $src $Destination /MIR /w:0 /r:0 /XF desktop.ini
