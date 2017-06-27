/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.

private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = 

switch (_type) do
{
	case "oil": {["oilu","oilp",false,1200,(localize "STR_Process_Oil")];};
	case "diamond": {["diamond","diamondc","sand",1350,(localize "STR_Process_Diamond")];};
	case "heroin": {["heroinu","heroinp",false,1750,(localize "STR_Process_Heroin")];};
	case "copper": {["copperore","copper_r",false,750,(localize "STR_Process_Copper")];};
	case "iron": {["ironore","iron_r",false,1120,(localize "STR_Process_Iron")];};
	case "sand": {["sand","glass",false,650,(localize "STR_Process_Sand")];};
	case "salt": {["salt","salt_r",false,450,(localize "STR_Process_Salt")];};
	case "cocaine": {["cocaine","cocainep",false,1500,(localize "STR_Process_Cocaine")];};
	case "marijuana": {["cannabis","marijuana",false,500,(localize "STR_Process_Marijuana")];};
	case "opium": {["opiumn","opium",false,900,(localize "STR_Process_Opium")];};
	case "cement": {["rock","cement",false,350,(localize "STR_Process_Cement")];};
	case "cidre": {["apple","cidre",false,200,(localize "STR_Process_Cidre")];};
	case "wine": {["vinu","vin",false,200,(localize "STR_Process_Wine")];};
	default {[];};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_multiple = _itemInfo select 2;
_cost = _itemInfo select 3;
_upp = _itemInfo select 4;

if (typeName _multiple == "STRING") then {
    _multipleTra = true;
    _multipleVal = missionNamespace getVariable ([_multiple,0] call life_fnc_varHandle);
    if(_multipleVal == 0) exitWith {};
};

_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};

    if(_multipleTra) then {
        if(!([false,_multiple,_multipleVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
        if(!([true,_multiple,_multipleVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_multiple,_multipleVal] call life_fnc_handleInv; life_is_processing = false;};
        _name = _oldVal + "," + _multipleVal;
	    5 cutText ["","PLAIN"];
	    titleText[format[localize "STR_Process_Processed",_name,_itemName],"PLAIN"];
    }else{
    	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
        if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	    5 cutText ["","PLAIN"];
	    titleText[format[localize "STR_Process_Processed",_oldVal,_itemName],"PLAIN"];
    };
	life_is_processing = false;

}else{

	if(life_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

    if(_multipleTra) then {
        if(!([false,_multiple,_multipleVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
        if(!([true,_multiple,_multipleVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_multiple,_multipleVal] call life_fnc_handleInv; life_is_processing = false;};
        _name = _oldVal + "," + _multipleVal;
        5 cutText ["","PLAIN"];
        titleText[format[localize "STR_Process_Processed",_name,_itemName],"PLAIN"];
    }else{
    	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
    	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
        5 cutText ["","PLAIN"];
    	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];

    };
    life_cash = life_cash - _cost;
	life_is_processing = false;
};*/


/*
	File: fn_processAction.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. OBJECT(pnj)
	2. STRING(RESSOURCE)

	RETURNS:
	NONE

	CALL:
	[OBJECT,STRING] call life_fnc_processAction
*/
private["_rscInfo","_min","_bon"];
_pnj = param[0,objNull,[objNull]];
_rsc = param[3,"",[""]];

// [	Resource Name,	Count,	[[[Required,Count],...],...]	]
_rscInfo = [_rsc] call life_fnc_processSwitch;

_rscName = _rscInfo select 0;
_rscProcessedCount = _rscInfo select 1;
_rscRecettes = _rscInfo select 2;
//_rscLicense = _rscInfo select 3;
//_lcs = missionNamespace getVariable _rscLicense;
_lcs = true;//pour l'instant
_nameShown = [([_rscNameRec,0] call life_fnc_varHandle)] call life_fnc_varToStr;
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_nameShown];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_lcs) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_nameShown];
		if(_cP >= 1) exitWith {};
		if(player distance _pnj > 10) exitWith {};
	};
	if(player distance _pnj > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	

	for "_i" from 0 to (count _rscRecettes)-1 do {
		_min = [(_rscRecettes select _i)] call life_fnc_minValue;
		_bon = _min select 0;
		_min = _min select 1;
		if(_bon) then{
			{
				_rscNameRec = _x select 0;
				[_rscNameRec,false,(_min * (_x select 1))] call life_fnc_handleInv;
			}foreach (_rscRecettes select _i);
			[_rscName,true,_min] call life_fnc_handleInv;
		};
	};
}else{
	hint "Vous n'avez pas les qualifications requises pour faire cela.";	
};
life_is_processing = false;