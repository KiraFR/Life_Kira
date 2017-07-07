/*
	File: fn_processAction.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	0. OBJECT(pnj)
	3. STRING(RESSOURCE)

	RETURNS:
	NONE

	CALL:
	[OBJECT,STRING] spawn life_fnc_processAction
	[player,"","","glass"] spawn life_fnc_processAction
*/
private["_rscInfo","_min","_bon","_nameShown"];
_pnj = param[0,objNull,[objNull]];
_rsc = param[3,"",[""]];

// [	Resource Name,	Count,	[[[Required,Count],...],...]	]
_rscInfo = [_rsc] call life_fnc_processSwitch;
_rsc = _rscInfo select 0;
_rscProcessedCount = _rscInfo select 1;
_rscRecettes = _rscInfo select 2;

//_rscLicense = _rscInfo select 3;
//_lcs = missionNamespace getVariable _rscLicense;

_lcs = true;//pour l'instant
_classname = [_rsc,0] call life_fnc_varHandle;
_nameShown = [_classname] call life_fnc_varToStr;
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Fabrication de %2 (1%1)...","%",_nameShown];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_lcs) then
{
	while{true} do
	{
		sleep 0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Fabrication de %3 (%1%2)...",round(_cP * 100),"%",_nameShown];
		if(_cP >= 1) exitWith {};
		if(player distance _pnj > 10) exitWith {};
	};
	if(player distance _pnj > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	if(_rsc == "Fishsoup")then{

		{
			_rec = _x;
			_index = _forEachIndex;
			for "_i" from 0 to (count _rec)-1 do {
				_min = [(_rec select _i)] call life_fnc_minValue;
				_bon = _min select 0;
				_min = _min select 1;
				if(_bon) then{
					{
						_rscNameRec = _x select 0;
						[false,_rscNameRec,(_min * (_x select 1))] call life_fnc_handleInv;
					}foreach (_rec select _i);
					[true,_rsc,_min*(_rscProcessedCount select _index)] call life_fnc_handleInv;
				};
				5 cutText ["","PLAIN"];
			};
		}foreach _rscRecettes;
	}else{
		for "_i" from 0 to (count _rscRecettes)-1 do {
			_min = [(_rscRecettes select _i)] call life_fnc_minValue;
			_bon = _min select 0;
			_min = _min select 1;
			if(_bon) then{
				{
					_rscNameRec = _x select 0;
					[false,_rscNameRec,(_min * (_x select 1))] call life_fnc_handleInv;
				}foreach (_rscRecettes select _i);
				[true,_rsc,_min*(_rscProcessedCount)] call life_fnc_handleInv;
			};
			5 cutText ["","PLAIN"];
		};
	};
}else{
	hint "Vous n'avez pas les qualifications requises pour faire cela.";	
};
life_is_processing = false;