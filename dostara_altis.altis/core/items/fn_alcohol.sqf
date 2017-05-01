/*
	File: fn_alcohol.sqf
	Auteur : B 'EnaTik' K

	Description:
	Les effets suite à la consommation du cidre et du vin
*/

closeDialog 0;

// Liste des effets activés
_blurEffect = ppEffectCreate ["DynamicBlur",500]; //creation du flou
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;
enableCamShake true;

titletext[localize "STR_ISTR_AlcoholEffect","PLAIN"];

for "_i" from 0 to 120 do // durée des effets
{
	_blurEffect ppEffectAdjust [3];
	_blurEffect ppEffectCommit 1;
	addcamShake[random 3, 1, random 3]; //Tremblement de camera
	sleep 1;
};

_blurEffect ppEffectAdjust [0];
_blurEffect ppEffectCommit 5;
sleep 6;

// Fin des effets
_blurEffect ppEffectEnable false;
ppEffectDestroy _blurEffect;
resetCamShake;