/*
	File: fn_forEmoji.sqf
	Author: J. `Kira` D.
	
	Description:
	fonction qui permet de 
*/
private["_arrayOfStr"];
params[
	["_msg","",[""]],
	["_color","",[""]],
	["_lor","",[""]]
];

_toArray = _msg splitString "";
diag_log format["%1",count _toArray];
for "_i" from 0 to count(_toArray)-3 do {
	diag_log format["_i: %1",_i];
	if(_toArray select _i == ":")then {
		_arrayOfStr = [[_toArray select _i,_toArray select _i+1,_toArray select _i+2],_color,_lor] call Kira_fnc_emojiCfg;
		_toArray set [_i,_arrayOfStr select 0];
		_toArray set [_i+1,_arrayOfStr select 1];
		_toArray set [_i+2,_arrayOfStr select 2];
	};
};

_msg = _toArray select 0;
for "_d" from 1 to count(_toArray)-1 do {
	_msg = format["%1%2",_msg, _toArray	select _d];
};
_msg;