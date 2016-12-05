/*
	File: fn_piqure.sqf
	Auteur : B 'EnaTik' K

	Description:
	Les effets suite à la prise d'opium
*/

closeDialog 0;

// Liste des effets :
_colorEffect = ppEffectCreate ["ColorCorrections",2500]; //creation de la couleur
_colorEffect ppEffectEnable true;
_colorEffect ppEffectForceInNVG true;

_blurEffect = ppEffectCreate ["DynamicBlur",500]; //creation du flou
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;

for "_i" from 0 to 180 do // durée des effets
{
	_colorEffect ppEffectAdjust [1, 1, -0.02, [1, 4, 3.5, -0.02],[1, 4, 3.5, 1],[-1.5,0,-0.2,1]]; //couleur plutot rouge
	_colorEffect ppEffectCommit 0.1;
	_blurEffect ppEffectAdjust [2];
	_BlurEffect ppEffectCommit 0.2;
	sleep 1;
};

// Fin des effets
_colorEffect ppEffectAdjust [0,0,true];
_colorEffect ppEffectCommit 3;
_blurEffect ppEffectAdjust  [0];
_blurEffect ppEffectCommit 3;
sleep 6;

_colorEffect ppEffectEnable false;
_blurEffect ppEffectEnable false;
ppEffectDestroy _colorEffect;
ppEffectDestroy _blurEffect;