#include "\life_server\script_macros.hpp"
/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
private ["_ressource","_count","_ent","_ownerID","_result","_minFor","_maxFor","_resultFor","_valueModif","_valueNew","_prix","_min","_max","_seil","_evol","_entValue","_relation","_value","_Object","_name","_newValueArray"];
params[["_ressource",""],["_count",""],["_ent",""],["_ownerID",""]];

if (isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;
if (!(isNil 'Bourse_Object')) then {
    _Object = Bourse_Object getVariable "Bourse";
    _result = [_ressource] call bourse_fnc_ressources;
    _countArr = count _result;
    if (_countArr != 0) then {
        _valueNew = 0;
        _min = (_result select 0);
        _max = (_result select 1);
        _seil = (_result select 2);
        _evol = (_result select 3);
        _entValue = (_result select 5);
        _value = {if (_ressource == (_x select 0)) exitWith {(_x select 1)}}forEach _Object;

        if (_ent) then {
            if (_entValue != 0) then {
                if (_value <= _entValue) exitWith {[0,false] remoteExecCall ["life_fnc_virt_sellBourse",_ownerID];};
            };
        };

        if (_max == -1) then {
            if (_value <= _min) then {
                _prix = _count * _min;
            }else{
                _prix = _count * _value;
            };
        }else{
            if (_value >= _max) then {
                _prix = _count * _max;
            }else{
                if (_value <= _min) then {
                    _prix = _count * _min;
                }else{
                    _prix = _count * _value;
                };
                diag_log format ["%1",_prix];
             };
        };
        Bourse_ressource_Save pushBack [_ressource,_count];
        [_prix] remoteExecCall ["life_fnc_virt_sellBourse",_ownerID];
    };
};
