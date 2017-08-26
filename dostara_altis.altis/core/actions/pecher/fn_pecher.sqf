/*
	File: fn_pecher.sqf
	Author: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. OBJECT (bateau)

	RETURNS:
	NONE

	CALL:
	[OBJECT] spawn life_fnc_pecher
*/
private _boat = param[0,objNull,[objNull]];
private _maxMin = param[1,[],[[]]];
private _poisson = [];
private _break = false;
_maxMin params[
	["_min",1,[0]],
	["_max",10,[0]],
	["_resistance",6,[0]]
];


while{!(isNil {_boat getVariable ['InUsefishing',nil]})} do {

	while {speed _boat > _min} do {
		sleep 3;
		_fishing = selectRandom ["Saupe","Girelle","Maquereau","Thon","Mulet","Roussette"];
		_poisson pushBack _fishing;
		_boat setVariable ["poissons",_poisson,true];
		if(count _poisson >= _resistance)exitWith{_break = true;};
		if(speed _boat > _max)exitWith{_break = true;};
		if(count _poisson == (_resistance-1))then{hint "Les capteurs du filet indiquent que le filet va lacher."};
		if(isNil {_boat getVariable ['InUsefishing',nil]})exitWith{};
	};
	if(_break)exitWith{
		hint "Le filet a laché !";
		_boat setVariable ['InUsefishing',nil];
		_boat setVariable ["poissons",nil,true];
		_id = _boat getVariable ["idAction",nil];
		if !(isNil "_id")then{
			_boat removeAction _id;
			_boat setVariable ["idAction",nil,true];
		};
	};
};