/*
	File: fn_rail.sqf
	Auteur : B 'EnaTik' K

	Description:
	Les effets suite à un petit rail de cocaine au calme
*/

closeDialog 0;

// Liste des effets activés :
_colorEffect = ppEffectCreate ["ChromAberration",250]; //creation de la couleur
_colorEffect ppEffectEnable true;
_colorEffect ppEffectForceInNVG true;

_blurEffect = ppEffectCreate ["DynamicBlur",500]; //creation du flou
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;

titletext[localize "STR_ISTR_CocaineEffect","PLAIN"];

for "_i" from 0 to 30 do // Effets actifs les 30 permières secondes
{
	_colorEffect ppEffectAdjust [random 0.3,random 0.3,true];
	_colorEffect ppEffectCommit 3;
	player setFatigue 0;
	sleep 1;
};

_colorEffect ppEffectEnable false;
ppEffectDestroy _colorEffect; // fin de l'effet couleur après 30 secs

for "_i" from 30 to 120 do // Effets actifs jusqu'à 2 minutes
{
	_blurEffect ppEffectAdjust [3];
	_blurEffect ppEffectCommit 3;
	player setFatigue 0;
	sleep 1;
};

_blurEffect ppEffectAdjust [0];
_blurEffect ppEffectCommit 3;
sleep 3;
_blurEffect ppEffectEnable false;
ppEffectDestroy _blurEffect; // Fin de l'effet flou arpès 2 minutes

for "_i" from 120 to 300 do // Effets actifs jusqu'a 5 minutes
{
	player setFatigue 0;
};
