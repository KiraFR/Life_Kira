/*
    File: fn_ContraFinished.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
private["_targetname","_murduid","_deuid"];
params [
	["_targetname","",[""]],
	["_murduid","",[""]],
	["_deuid","",[""]]

];
_type = if(_targetname) then {_type == 1;}else {_type == 2;};

switch (_type) do { 
	case 1 : { 
	
		[_targetname,_murduid] RemoteExecCall  ["ASSA_fnc_TransferToMurd",RSERV]; 
	}; 
	case 2 : { 
		[_deuid,_murduid] RemoteExecCall  ["ASSA_fnc_TransferToMurd",RSERV]; 
	 }; 
};
