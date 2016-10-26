private ["_params","_code"];
_params = [];
params[["_code",{},[{},[]]]];

if (typename _code == typename []) then {
	params[
		["_params",[]],
		["_code",{},[{}]]
	];
};

_params call _code