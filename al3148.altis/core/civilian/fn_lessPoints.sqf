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

hint format["Une amende de %1€ et un retrait de %2 points ont été effectuer sur votre personne car vous rouliez à %3km/h, ce qui est %4km/h au dessus de la limite autorisée.",
	life_amende *_nbrPoint,
	_nbrPoint,
	round _speed,
	_plus
];
life_atmcash = life_atmcash - (life_amende *_nbrPoint);
[] call life_fnc_hudUpdate;
[9] call SOCK_fnc_updatePartial;
