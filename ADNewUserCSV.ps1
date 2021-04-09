# Ce script à pour but de remplir la même fonction de ADNewUser, càd ajouter des utilisateurs au domaine, mais cette fois ci à l'aide d'un fichier CSV qui se chargera de saisir les informations à la place de l'utilisateur

# Designe le document à utiliser, et quel séparateur il utilise
Import-Csv "M:\Scripts\ADscripts-OC\usr.csv" -Delimiter ';' -Verbose

# Fonction qui définit la forme que va prendre chaque paramètre
ForEach-Object {
New-ADuser 
-Name $_.Name
-GivenName $_.givenname
-Surname $_.sn
-path $_."Utilisateurs du domaine"
-SamAccountName $_.samaccountname
-UserPrincipalName ($_.samaccountname + @ + acme.fr)
-Accountpassword (ConvertTo-SecureString "Bonjour58!" -AsPlainText -Force)
-emailaddress $_."email address"
-Enabled $true
-Changepasswordatlogon $true
}