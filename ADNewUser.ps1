# Ceci est un script ayant pour but de créer des utilisateurs Active Directory à partir des informations qui lui seront données.
# Le script peut prendre les informations en ligne de commande, ou de manière interactive.
# version 0.1
# Auteur : Corentin Blondiau

#Force le type d'execution
Set-executionpolicy Unrestricted

# Importe le module AD
Import-Module ActiveDirectory

# Les commandes suivantes vont recueillir les informations essentielles à la création d'un nouvel utilisateur, puis les stocker dans des valeurs

# Demande le nom et prénom de l'utilisateur
$prenom = Read-host "Entrez le prénom de l'utilisateur"
$nom = Read-Host "Entrez le nom de l'utilisateur"

# Crée son nom d'utilisateur à partir du nom et prénom
$login = $prenom.substring(0,1)+$nom

# Demande dans quel groupe l'utilisateur doit être inséré
$group = read-host "Dans quel groupe souhaitez vous insérer le nouvel utilisateur ?"

# Cette commande va reprendre les informations enregistrée dans les valeurs introduites plus tôt et les intégrer à la commande de création de l'utilisateur.
# Elle va ensuite créer le compte, et ajouter deux paramètres. L'utilisateur va être autorisé à changer son mot de passe, mais celui donné plus tôt à une validité infinie dans le temps.

New-ADUser -Name $nom+$prenom -SamAccountName $login -UserPrincipalName $login@acme.fr -AccountPassword (ConvertTo-SecureString -AsPlainText Bonjour58! -Force) -PasswordNeverExpires $true -CannotChangePassword $false -Enabled $true

# Cette commande va ajouter l'utilisateur au groupe renseigné
Add-ADgroupmember -identity $group -members $login

# Confirmation de l'inscription de l'utilisateur
Write-Host "L'utilisateur $login fait désormais partie de votre domaine et du groupe $group"

# Cette commande va permettre de créer un dossier au nom de l'utilisateur dans un dossier partagé dédié
New-Item -Path C:\Partage\$login -ItemType Directory
