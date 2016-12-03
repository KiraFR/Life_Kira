#include "..\..\macro.h"
/*
	File: fn_creatAccount.sqf
	Author: R. `KronosD` R.

	Description:
	créer un numéro et l'envoi au serveur
*/
private["_num"];
_prefixe = _this select 3;
_owner = player;
_uid = getPlayerUID _owner;

switch (true) do {
	case 1: {
				if(_prefixe == "")exitwith{hint "Problème de préfixe, contactez un Administrateur."};
				if(isNil "_owner")exitwith{hint "Vous n'êtes apparemment pas un joueur"};
				if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
				if(life_cash < 100) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";}; 
				life_cash = life_cash - 100;
				_value = str(floor random 100000);
				_numcount= toArray _value;
				switch(true) do {
					case (count _numcount == 1):{ _num = _prefixe + format["0000%1",_value];};
					case (count _numcount == 2):{ _num = _prefixe + format["000%1",_value];};
					case (count _numcount == 3):{ _num = _prefixe + format["00%1",_value];};
					case (count _numcount == 4):{ _num = _prefixe + format["0%1",_value];};
					case (count _numcount == 5):{ _num = _prefixe + format["%1",_value];};
				};
				diag_log format["_num: %1",_num];

				hint "Votre compte a bien était creer";
				[0] call SOCK_fnc_updatePartial;
				[] call life_fnc_hudUpdate;
				[_uid,_num,_owner,_prefixe] remoteExecCall ["BQKS_fnc_CreateAccount",2];
			};
	
	case 2: {
				if(_prefixe == "")exitwith{hint "Problème de préfixe, contactez un Administrateur."};
				if(isNil "_owner")exitwith{hint "Vous n'êtes apparemment pas un joueur"};
				if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
				if(life_cash < 20000) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";}; 
				life_cash = life_cash - 20000;
				_value = str(floor random 100000);
				_numcount= toArray _value;
				switch(true) do {
					case (count _numcount == 1):{ _num = _prefixe + format["0000%1",_value];};
					case (count _numcount == 2):{ _num = _prefixe + format["000%1",_value];};
					case (count _numcount == 3):{ _num = _prefixe + format["00%1",_value];};
					case (count _numcount == 4):{ _num = _prefixe + format["0%1",_value];};
					case (count _numcount == 5):{ _num = _prefixe + format["%1",_value];};
				};
				diag_log format["_num: %1",_num];

				hint "Votre compte a bien était creer";
				[0] call SOCK_fnc_updatePartial;
				[] call life_fnc_hudUpdate;
				[_uid,_num,_owner,_prefixe] remoteExecCall ["BQKS_fnc_CreateAccountOff",2];
			};
			
	case 3: {
				if(_prefixe == "")exitwith{hint "Problème de préfixe, contactez un Administrateur."};
				if(isNil "_owner")exitwith{hint "Vous n'êtes apparemment pas un joueur"};
				if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
				if(life_cash < 10000) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";}; 
				life_cash = life_cash - 10000;
				_value = str(floor random 100000);
				_numcount= toArray _value;
				switch(true) do {
					case (count _numcount == 1):{ _num = _prefixe + format["0000%1",_value];};
					case (count _numcount == 2):{ _num = _prefixe + format["000%1",_value];};
					case (count _numcount == 3):{ _num = _prefixe + format["00%1",_value];};
					case (count _numcount == 4):{ _num = _prefixe + format["0%1",_value];};
					case (count _numcount == 5):{ _num = _prefixe + format["%1",_value];};
				};
				diag_log format["_num: %1",_num];

				hint "Votre compte a bien était creer";
				[0] call SOCK_fnc_updatePartial;
				[] call life_fnc_hudUpdate;
				[_uid,_num,_owner,_prefixe] remoteExecCall ["BQKS_fnc_CreateAccountEntre",2];
			};
};