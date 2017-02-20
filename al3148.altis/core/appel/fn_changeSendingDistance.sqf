/*
	File: fn_changeSendingDistance.sqf
	Auteur: J. `Kira` D.
	
	Description:
	Change Sending Distance

	PARAM: 
	1: TYPE(NUMBER)

	CALL:
	TYPE call Call_fnc_changeSendingDistance;
*/
switch{_this} do {
	case 0 : {
		if((player getVariable ["tf_sendingDistanceMultiplicator",1]) != 30) then {
			player setVariable ["tf_sendingDistanceMultiplicator",30,true];
		};
		if((player getVariable ["tf_receivingDistanceMultiplicator",1]) != 1) then {
			player setVariable ["tf_receivingDistanceMultiplicator",1,true];
		};
		if((player getVariable ["tf_terrain_interception_coefficient",7]) != 5) then {
			player setVariable ["tf_terrain_interception_coefficient",5,true];
		};
	};
	case 1:{
		if((player getVariable ["tf_sendingDistanceMultiplicator",1]) != 1) then {
			player setVariable ["tf_sendingDistanceMultiplicator",1,true];
		};
		if((player getVariable ["tf_receivingDistanceMultiplicator",1]) != 1) then {
			player setVariable ["tf_receivingDistanceMultiplicator",1,true];
		};
		if((player getVariable ["tf_terrain_interception_coefficient",7]) != 7) then {
			player setVariable ["tf_terrain_interception_coefficient",7,true];
		};
	};
};