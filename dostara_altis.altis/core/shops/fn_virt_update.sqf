#include "..\..\macro.h"
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_price","_id","_val"];
disableSerialization;

[player,"life_fnc_bourseUpdate"] remoteExecCall ["Bourse_fnc_ReturnBourse",2];

//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;

//Purge list
lbClear _item_list;
lbClear _gear_list;

_shop_data = [life_shop_type] call life_fnc_virt_shops;
ctrlSetText[2403,format["%1", _shop_data select 0]];

{
	_name = [([_x,0] call life_fnc_varHandle)] call life_fnc_vartostr;
	_index = [_x,__GETC__(sell_array)] call life_fnc_index;
	if(_index != -1) then{
		_price = round(((__GETC__(sell_array) select _index) select 1));
		if (_price != -1) then {
            _item_list lbAdd format["%1  (€%2)",_name,[_price] call life_fnc_numberText];
            _item_list lbSetData [(lbSize _item_list)-1,_x];
            _item_list lbSetValue [(lbSize _item_list)-1,_price];
		};
	};

} forEach (_shop_data select 1);

{
	_var = [_x,0] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _var;
	_name = [_var] call life_fnc_vartostr;
    if (_var in Bourse_VarIteams) then {
	    if(_val > 0) then
	    {

	        _id = Bourse_VarIteams find _var;
	        _Obj = Bourse_Object select _id;
	        _price = round(_Obj select 1);
		    _gear_list lbAdd format["%1x %2  ( %3€ )",_val,_name,_price];
		    _gear_list lbSetData [(lbSize _gear_list)-1,_x];
	    };
    };
} forEach (_shop_data select 1);