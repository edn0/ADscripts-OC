# Ceci est un script a pour but de créer des utilisateurs Active Directory à partir des informations qui lui seront données.
# Le script peut prendre les informations en ligne de commande, ou de manière interactive.
# Le script va créer un utilisateur avec le prénom et nom complet, et son nom d'utilisateur sera la première lettre de son prénom suivi de son nom de famille complet.
# version 1.3
# Auteur : Corentin Blondiau

# Ceci va permettre d'assigner une valeur aux variables nom et prénom directement en appelant le script. Ces paramètres sont obligatoires.
# Usage : ./ADNewUser.ps1 -prenom Bill -nom Boquet -group InventionsRévolutionnaires
param([Parameter(mandatory=$true)]$prenom,[Parameter(mandatory=$true)] $nom,[Parameter(mandatory=$true)] $group)

# Crée son nom d'utilisateur à partir du nom et prénom en ne conservant que la première lettre du prénom, associé au nom de famille
$login = $prenom.substring(0,1)+$nom

# Cette commande va reprendre les informations enregistrée dans les valeurs introduites plus tôt et les intégrer à la commande de création de l'utilisateur.
# Elle va ensuite créer le compte, et ajouter deux paramètres. L'utilisateur va être autorisé à changer son mot de passe, mais celui donné plus tôt à une validité infinie dans le temps.
New-ADUser -Name $prenom$nom -SamAccountName $login -UserPrincipalName $login@acme.fr -AccountPassword (ConvertTo-SecureString -AsPlainText Bonjour58! -Force) -PasswordNeverExpires $true -CannotChangePassword $false -Enabled $true

# Cette commande va ajouter l'utilisateur au groupe renseigné
Add-ADgroupmember -identity $group -members $login

# Cette commande va permettre de créer un dossier au nom de l'utilisateur dans un dossier partagé
New-Item -Path C:\Partage\Personnel\$login -ItemType Directory

 #Le script récupère les autorisasions sur le dossier et supprime toutes les autorisations héritées
$acl = Get-Acl C:\Partage\Personnel\$login
$acl.SetAccessRuleProtection($true,$false)
$acl | Set-Acl

# Définition des règles de permission
$usraccess = New-Object System.Security.AccessControl.FileSystemAccessRule("$login","FullControl","ContainerInherit, ObjectInherit", "None","Allow")
$adminaccess = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrateur","FullControl","ContainerInherit, ObjectInherit", "None","Allow")
# Ajout des droits de contrôle total pour l'utilisateur et l'administrateur
$acl.SetAccessRule($usraccess)
$acl.SetAccessRule($adminaccess)
$acl | Set-Acl

# Confirmation de l'inscription de l'utilisateur
Write-Host "L'utilisateur $login fait désormais partie de votre domaine et du groupe $group. Un dossier à son nom a été créé dans le dossier \\WVM\Partage\Personnel."
