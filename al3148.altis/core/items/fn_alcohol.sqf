/*
	File: fn_alcohol.sqf

	Description: Les effets suite à la consommation du cidre et du vin
*/

closeDialog 0;

// Liste des effets activés
"dynamicBlur" ppEffectEnable true;
enableCamShake true;

titletext[localize "STR_ISTR_AlcoholEffect"];

for "_i" from 0 to 120 do // durée des effets
{
	"dynamicBlur" ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
	"dynamicBlur" ppEffectCommit 1;
	addcamShake[random 3, 1, random 3];
	sleep 1;
};

// Fin des effets
"dynamicBlur" ppEffectAdjust  [0,0,0,0];
"dynamicBlur" ppEffectCommit 5;
sleep 6;

"dynamicBlur" ppEffectEnable false;
resetCamShake;