/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
private["_Object","_ObjectLast","_Object2","_Sell","_Sell_2","_Resources","_Resource_2","_Id_Object2","_newValueArray","_Object_Bourse","_resource","_count","_ent","_ownerID","_result","_valueNew","_prix","_min","_max","_seil","_evol","_entValue","_relation","_value","_name"];
uiSleep 5;
while {true} do {
    _ObjectLast = Bourse_Resource_Save;
    Sleep 30;
    _Object = Bourse_Resource_Save;
    if ((count _Object) != 0) then {
        if (!(_ObjectLast isEqualTo _Object)) then {
            _Object2 = [];
            {
                _Sell = (_x select 1);
                _Resources = (_x select 0);
                _Id_Object2 = -1;
                {
                    _Resources_2 = (_x select 0);
                    _Sell_2 = (_x select 1);
                    if (_Resources == _Resources_2) exitWith {
                        _Id_Object2  = (_Object2 find [_Resources_2,_Sell_2]);
                    };
                } forEach _Object2;
                if (_Id_Object2 == -1) then {
                    _Object2 pushBack [_Resources,_Sell];
                } else {
                    _newValueArray = (((_Object select _Id_Object2) select 1) + _Sell);
                    _Object set [_Id_Object2,[_Resources,_newValueArray]];
                };
            } forEach _Object;

            {
                _Object_Bourse = Bourse_Object getVariable "Bourse";
                _ent = false;
                _result = [_x select 0] call bourse_fnc_resources;
                _count = (_x select 1);
                _countArr = count _result;
                if (_countArr != 0) then {
                    _valueNew = 0;
                    _min = (_result select 0);
                    _max = (_result select 1);
                    _seil = (_result select 2);
                    _evol = (_result select 3);
                    _entValue = (_result select 5);
                    _relation = (_result select 6);
                    _value = {if (_resource == (_x select 0)) exitWith {(_x select 1)}}forEach _Object_Bourse;
                    if (_ent) then {
                        if (_entValue != 0) then {
                            if (_value <= _entValue) exitWith {[0,false] remoteExecCall ["life_fnc_virt_sellBourse",_ownerID];};
                        };
                    };
                    if (_max == -1) then {
                        if (_value <= _min) then {
                            _prix = _count * _min;
                            _valueNew = _min;
                        }else{
                            _prix = _count * _value;
                            if (_value >= _seil) then {
                                _valueNew = (_value - (_count * _evol));
                            }else{
                                _valueNew = (_value - (_count));
                            };
                        };
                    }else{
                        if (_value >= _max) then {
                            _prix = _count * _max;
                            _valueNew = _max;
                        }else{
                            if (_value <= _min) then {
                                _prix = _count * _min;
                                _valueNew = _min;
                            }else{
                                _prix = _count * _value;
                                if (_value >= _seil) then {
                                    _valueNew = (_value - (_count * _evol));
                                }else{
                                    _valueNew = (_value - (_count));
                                };
                            };
                         };
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

                                _resultFor = [_name] call bourse_fnc_resources;
                                _minFor = (_resultFor select 0);
                                _maxFor = (_resultFor select 1);

                                if (_maxFor == -1) then {
                                    if (_valueModif <= _minFor) then {_valueModif = _minFor;};
                                }else{
                                    if (_valueModif >= _maxFor) then {_valueModif = _maxFor;};
                                    if (_valueModif <= _minFor) then {_valueModif = _minFor;};
                                };

                                _ValueArray = [_name,(_x select 1)];
                                _id = _Object find _valueArray;
                                _newValueArray = [_name,((_x select 1) + (_valueModif))];
                                _Object set [_id,_newValueArray];
                                if (true) exitWith {};
                            };
                        }forEach _Object;
                    }forEach _relation;
                    Bourse_Object setVariable ["Bourse",_Object_Bourse, true];
                };
            } forEach _Object2;
        };
    };
};
