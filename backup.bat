# Ce script va permettre d'appeler le script de sauvegarde depuis la machine cliente via une tâche planifée

echo on
powershell.exe -nologo -file "\\WVM\Partage\backup.ps1"
