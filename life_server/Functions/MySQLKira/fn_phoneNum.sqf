/*
	File: fn_phoneNum.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme


	PARAMETRES:

	RETURNS:
	NONE

	CALL:
	[] call KIRA_fnc_phoneNum
*/
_prefixe = param[0,"",[""]];
_player = param[1,objNull,[objNull]];
_allnumber = ["SELECT numero FROM phonenumber",2,true] call DB_fnc_asyncCall;

_fiveNumber = floor(random(99999));
_fiveNumber = str(_fiveNumber);

_fiveNumber = _fiveNumber splitString "";
switch (count _fiveNumber) do { 
	case 1 : { _fiveNumber = format["0000%1",_fiveNumber joinString ""]; }; 
	case 2 : { _fiveNumber = format["000%1",_fiveNumber joinString ""]; }; 
	case 3 : { _fiveNumber = format["00%1",_fiveNumber joinString ""]; }; 
	case 4 : { _fiveNumber = format["0%1",_fiveNumber joinString ""]; };
	default {_fiveNumber = _fiveNumber joinString "";}
};

while {(_allnumber find [_fiveNumber]) != -1} do {
	_fiveNumber = floor(random(99999));
	_fiveNumber = str(_fiveNumber);

	_fiveNumber = _fiveNumber splitString "";
	switch (count _fiveNumber) do {
		case 1 : { _fiveNumber = format["0000%1",_fiveNumber joinString ""]; }; 
		case 2 : { _fiveNumber = format["000%1",_fiveNumber joinString ""]; }; 
		case 3 : { _fiveNumber = format["00%1",_fiveNumber joinString ""]; }; 
		case 4 : { _fiveNumber = format["0%1",_fiveNumber joinString ""]; };
		default { _fiveNumber = _fiveNumber joinString "";};
	};
};
_query = format["INSERT INTO phonenumber(pid_owner,numero,active) VALUES(%1,%2,'1');",getPlayerUID _player,format["%1%2",_prefixe,_fiveNumber]];
[_query,1] call DB_fnc_asyncCall;
_player setVariable ["phonenumber",format["%1%2",_prefixe,_fiveNumber],true];