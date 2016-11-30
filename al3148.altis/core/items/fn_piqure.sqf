/*
	File: fn_piqure.sqf

	Description: Les effets suite à l'injection de l'héroine
*/

closeDialog 0;

// Liste des effets activés
"dynamicBlur" ppEffectEnable true;
"chromAberration" ppEffectEnable true;
titletext[localize "STR_ISTR_PiqureEffect","PLAIN"];

for "_i" from 0 to 180 do // durée des effets
{
	"dynamicBlur" ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
	"dynamicBlur" ppEffectCommit 1;
	"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
	"chromAberration" ppEffectCommit 1;
	player setFatigue 1;
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