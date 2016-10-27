/*
	File: fn_select.sqf
	Author: J. `Kira` D.
	
	Description:
	juste une copie du fichier fn_cellphone.sqf avec comme seul changement la liste de contact
*/
private["_countnum","_contact","_num"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0] call BIS_fnc_param;
disableSerialization;
_display = findDisplay 3000;
_repertoire = _display displayCtrl 3011;
_annuaire = _display displayCtrl 3071;
ctrlEnable[3006,true];
switch(_type)do {
	//repertoire/Annuaire
	case 0:{
		_contact = call compile format["%1",_data];
		if(typeName (_contact select 0) == "SCALAR") then {
			_countnum = toArray str(_contact select 0);
			if(count _countnum == 5)then {_num = "0" + format ["%1",_contact select 0];};	
			life_index_phone = [_num,_contact select 1,_contact select 2,_contact select 3];
		}else{
			life_index_phone = [_contact select 0,_contact select 1,_contact select 2,_contact select 3];
		};
		_edit = ctrlshown _repertoire;
		_add = ctrlshown _annuaire;
		switch(true)do{
			case _edit:{
				ctrlEnable[3011,true];
				ctrlEnable[3007,true];
				ctrlEnable[3009,true];
			};
			case _add:{
				ctrlEnable[3071,true];
			};
		};
		ctrlEnable[3066,False];
		ctrlEnable[3067,False];
	};
	//Message
	case 1:{
		_cible = call compile format["%1",lnbData[3004,[_data,0]]];
		life_index_phone = _cible select 3;
		[_cible] call life_fnc_messageShow;
		_edit = ctrlshown _repertoire;
		_add = ctrlshown _annuaire;
		switch(true)do{
			case _edit:{
				ctrlEnable[3011,false];
				ctrlEnable[3007,false];
				ctrlEnable[3009,false];
			};
			case _add:{
				ctrlEnable[3071,false];
			};
		};
		ctrlEnable[3066,true];
		ctrlEnable[3067,true];
	};
};