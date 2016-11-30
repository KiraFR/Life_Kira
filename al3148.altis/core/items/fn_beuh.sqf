/*
	File: fn_beuh.sqf

	Description: Les effets suite à la consommation du cannabis
*/

closeDialog 0;

// Liste des effets activés
"dynamicBlur" ppEffectEnable true;
"chromAberration" ppEffectEnable true;

titletext[localize "STR_ISTR_BeuhEffect","PLAIN"];

for "_i" from 0 to 60 do // durée des effets
{
	"dynamicBlur" ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
	"dynamicBlur" ppEffectCommit 1;
	"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
	"chromAberration" ppEffectCommit 1;
	sleep 1;
};

// Fin des effets
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"dynamicBlur" ppEffectAdjust  [0,0,0,0];
"dynamicBlur" ppEffectCommit 5;
sleep 6;

"chromAberration" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;
