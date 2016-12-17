/*
	File: fn_lessPoints.sqf
	Author: J `Kira` D
	
	Description:
	enlever points permis
*/
private["_nbrPoint"];
params[
	["_veh",objNull,[objNull]],
	["_speed",0,[0]],
	["_limit",0,[0]]
];
_speed = round _speed;
if(_speed < _limit) exitWith{};
if(vehicle player != _veh) exitWith {};
_plus = round _speed - _limit;
_nbrPoint = 0;

switch(true)do{
	case (_plus > 30  && _plus < 40): {
		_nbrPoint = 1;
		life_pPermis = life_pPermis - _nbrPoint;
	};
	case (_plus > 40): {
		_nbrPoint = 2;
		life_pPermis = life_pPermis - _nbrPoint;
	};
};

hint format["<t color='#FFCC00'><t size='2'><t align='center'>Une amende et un retrait ont été effectuer sur votre personne<br/><t align='left'><t size='1'>Montant: %1€<br/><t align='left'><t size='1'>Points: %2 points<br/><t align='left'><t size='1'>Raison: Vous rouliez à %3km/h, ce qui est %4km/h au dessus de la limite autorisée.",
	life_amende *_nbrPoint,
	_nbrPoint,
	round _speed,
	_plus
];

if(life_pPermis <= 0)then {
	missionNamespace setVariable["license_civ_driver",false];
	missionNamespace setVariable["license_civ_truck",false];
	hint "Vous venez de perdre votre permis voiture et camion, vous devez attendre 1h pour pouvoir en racheter un nouveau.";
	life_waitpermis = true;
	life_pPermis = 0;
	[10] call SOCK_fnc_updatePartial;
};
if (life_nbAcc == 0) then {life_cash = life_cash - (life_amende*_nbrPoint)} else{ life_atmcash = life_atmcash - (life_amende *_nbrPoint)};
[] call life_fnc_hudUpdate;
[9] call SOCK_fnc_updatePartial;
