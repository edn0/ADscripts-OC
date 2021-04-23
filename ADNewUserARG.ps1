# Ce script a pour but de tester la possibilité d'appeler ADNewUser.ps1 avec des arguments. Il est voué à disparaitre et a voir ses fonctions intégrées à ADNewUser.ps1

# Ceci est un script ayant pour but de créer des utilisateurs Active Directory à partir des informations qui lui seront données.
# Le script peut prendre les informations en ligne de commande, ou de manière interactive.
# Le script va créer un utilisateur avec le prénom et nom complet, et son nom d'utilisateur sera la première lettre de son prénom suivi de son nom de famille complet.
# version 1.0
# Auteur : Corentin Blondiau

# Ceci va permettre d'assigner une valeur aux variables nom et prénom directement en appelant le script. Ces paramètres sont obligatoires.
# Usage : ./ADNewUser.ps1 -prenom Bill -nom Boquet -group Inventions révolutionnaires
param([Parameter(mandatory=$true)] $prenom,[Parameter(mandatory=$true)] $nom, [Parameter(mandatory=$true)] $group)

# Cette fonction va s'assurer que les champs aient été remplis, autrement il sera demandé à l'utilisateur de les fournir
function usrprompt {
    if ($prenom -eq ""){
        $prenom = Read-host "Entrez le prénom de l'utilisateur"
}
    if($nom -eq ""){
        $nom = Read-Host "Entrez le nom de l'utilisateur"
}
    if($group -eq ""){
        $group = read-host "Dans quel groupe souhaitez vous ins�rer le nouvel utilisateur ?"
} 
}


# Cr�e son nom d'utilisateur � partir du nom et pr�nom en ne conservant que la premi�re lettre du pr�nom, associ� au nom de famille
$login = $prenom.substring(0,1)+$nom

# Cette commande va reprendre les informations enregistrée dans les valeurs introduites plus tôt et les intégrer à la commande de création de l'utilisateur.
# Elle va ensuite créer le compte, et ajouter deux paramètres. L'utilisateur va être autorisé à changer son mot de passe, mais celui donné plus tôt à une validité infinie dans le temps.

New-ADUser -Name $prenom$nom -SamAccountName $login -UserPrincipalName $login@acme.fr -AccountPassword (ConvertTo-SecureString -AsPlainText Bonjour58! -Force) -PasswordNeverExpires $true -CannotChangePassword $false -Enabled $true

# Cette commande va ajouter l'utilisateur au groupe renseign�
Add-ADgroupmember -identity $group -members $login

# Confirmation de l'inscription de l'utilisateur
Write-Host "L'utilisateur $login fait d�sormais partie de votre domaine et du groupe $group. Un dossier à son nom a été créé dans le dossier \\WVM\Partage\Personnel."

# Cette commande va permettre de créer un dossier au nom de l'utilisateur dans un dossier partagé
New-Item -Path C:\Partage\Personnel\$login -ItemType Directory
