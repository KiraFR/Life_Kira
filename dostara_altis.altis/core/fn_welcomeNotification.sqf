/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Bienvenue %1, Merci de lire",profileName] hintC
[
    "Bienvenue sur Dostara ! Le serveur est encore en developpement - Alpha-Ouverte !",
    "Si vous rencontrez des bugs, merci de nous les signaler via le forum.",
    "Attention les personnes faisant du HRP seront passibles de sanctions.",
    "Les reboots sont toutes les 6 heures : 3h - 9h - 15h - 21h.",
    "Bon jeu à vous!"
];