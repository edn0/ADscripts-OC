**# ADscripts-OC**

Ces scripts ont pour projet d'automatiser les tâches les plus courantes pour un administrateur Windows Server.

**ADNewUser** permet de créer un utilisateur à partir des informations fournies par l'utilisateur en arguments ou bien de manière interactive.

**addgroupe** permet à l'utilisateur de créer un groupe dans l'AD et d'y ajouter un ou plusieurs membres.  

**usergrouplist** permet de lister les groupes dont fait partie un utilisateur.

**getgroupmembers** permet de lister les utilisateurs d'un groupe donné.

**backup** permet de faire une sauvegarde du dossier "Documents" des utilisateurs du domaine s'étant connecté sur le poste depuis lequel le script est lancé. Il est assisté par **backup.bat** qui lui va appeler le script de sauvegarde, après avoir été lui-même appelé par une tâche planifiée pour une sauvegarde quotidienne.
