#include "..\..\macro.h"
/*
	File: fn_sendMsg.sqf
	Author: J `Kira` D
	
	Description:
	juste une copie du fichier fn_cellphone.sqf avec comme seul changement la liste de contact
*/
private["_display","_cMessageHeader","_index","_countnum","_name","_westList","_indeList"];
params[["_type2",0],["_type",0]];
disableSerialization;
_display = findDisplay 3100;
_cMessageHeader = _display displayCtrl 3101;
ctrlSetText [3103, ""];
if((isNil "life_adminlevel") OR (__GETC__(life_adminlevel) < 1)) then {
	ctrlShow[3106,false];
	ctrlShow[3105,false];
};
if(typeName life_index_phone == "ARRAY") then {
	_type2 = life_index_phone select 3;
	_name = life_index_phone select 2;
	life_index_phone = life_index_phone select 0;
};
switch(_type) do {
	case 0:{
		switch (_type2) do {
			case 0:{
				{
					_num = _x select 1;
					if(_num == life_index_phone) then{
						_index = format["%1",_x select 0];
					};
				}forEach life_repertoire;
				if(isNil "_index")then{_index = life_index_phone};
					_cMessageHeader ctrlSetText format["Envoi a: %1",_index];
				};
			case 1:{
				_cMessageHeader ctrlSetText format["Envoi a: %1",_name];
			};
			case 2:{
				_cMessageHeader ctrlSetText "Envoi a: Votre Gang";
			};
		};
		_westList = [
			"Bonjour, la Gendarmerie a bien reçu votre message. Une patrouille est en route.",
			"Bonjour, la Gendarmerie a bien reçu votre message. Une patrouille est en route. Pouvez-vous nous communiquer plus d'informations ?",
			"Message Formaté 3 / Voir Joe Bacon pour modification",
			"Message Formaté 4 / Voir Joe Bacon pour modification"
		];

		_indeList = [
			"Message Formaté 1 / Voir Joe Bacon pour modification",
			"Message Formaté 2 / Voir Joe Bacon pour modification",
			"Message Formaté 3 / Voir Joe Bacon pour modification",
			"Message Formaté 4 / Voir Joe Bacon pour modification"
		];

		switch(playerSide) do {
			case west:{
				lbclear 3112;
				{
					diag_log _x;
					_list = lbAdd[3112,_x];
					lbSetData [3112,_list,_x];
				}foreach _westList;
				ctrlShow[3110,false];
				ctrlShow[3111,false];
			};
			case independent:{
				lbclear 3112;
				{
					_list = lbAdd[3112,_x];
					lbSetData [3112,_list,_x];
				}foreach _indeList;
				ctrlShow[3109,false];
				ctrlShow[3108,false];
			};
			case civilian:{
				ctrlShow[3112,false];
				ctrlShow[3110,false];
				ctrlShow[3111,false];
				ctrlShow[3109,false];
				ctrlShow[3108,false];
			};
		};
	};
	case 1:{
		_msg = lbData[3112,(lbCurSel 3112)];
		ctrlSetText [3103, format["%1",_msg]];
	};
};