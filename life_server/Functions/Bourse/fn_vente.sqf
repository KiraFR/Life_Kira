#include "\life_server\script_macros.hpp"
/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
private ["_resource","_count","_ent","_ownerID","_result","_valueNew","_prix","_min","_max","_seil","_evol","_entValue","_relation","_value","_Object","_name"];
params["_resource","_count","_ent","_ownerID"];
_valide = false;
if (!(isServer)) then {
    if (isNull _ownerID) exitWith {};
    _ownerID = owner _ownerID;
};
if (!(isNil 'Bourse_Object')) then {
    _Object = Bourse_Object getVariable "Bourse";
    _result = [_resource] call bourse_fnc_resources;
    _countArr = count _result;
    if (_countArr != 0) then {
        _valueNew = 0;
        _min = (_result select 0);
        _max = (_result select 1);
        _seil = (_result select 2);
        _evol = (_result select 3);
        _entValue = (_result select 5);
        _relation = (_result select 6);
        _value = {if (_resource == (_x select 0)) exitWith {(_x select 1)}}forEach _Object;

        if (_ent) then {
            if (_entValue != 0) then {
                if (_value <= _entValue) exitWith {[0,false] remoteExecCall ["life_fnc_virt_sellBourse",_ownerID];};
            };
        };

        if (_max == -1) then {
            if (_value < _min) then {
                _prix = _count * _min;
                diag_log "Min";
            }else{
                _prix = _count * _value;
                diag_log "Nor";
            };
        }else{
            if (_value > _max) then {
                _prix = _count * _max;
                diag_log "Max";
            }else{
                if (_value < _min) then {
                    _prix = _count * _min;
                    diag_log "Min";
                }else{
                    _prix = _count * _value;
                    diag_log "Nor";
                };
             };
        };

        diag_log format ["%1",_prix];
        diag_log format ["%1",_value];

        if (_value >= _seil) then {
            _valueNew = (_value - (_count * _evol));
        }else{
            _valueNew = (_value - (_count));
        };

        _valueArray = [_resource,_value];
        _id = _Object find _valueArray;
        _newValueArray = [_resource,_valueNew];
        _Object set [_id,_newValueArray];
        {
            _name = (_x select 0);
            _cofi = (_x select 1);
            _valueModif = _count * _cofi;
            {
                if (_name == (_x select 0)) then {

                    _ValueArray = [_name,(_x select 1)];
                    _id = _Object find _valueArray;
                    _newValueArray = [_name,((_x select 1) + (_valueModif))];
                    _Object set [_id,_newValueArray];

                };
            }forEach _Object;
        }forEach _relation;
        Bourse_Object setVariable ["Bourse",_Object, true];
        [_prix] remoteExecCall ["life_fnc_virt_sellBourse",_ownerID];
    };
};