/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
private["_Object","_ObjectLast","_Object2","_Sell","_Sell_2","_ressources","_maxFor","_minFor","_ressource_2","_Id_Object2","_valueModif","_newValueArray","_Object_Bourse","_ressource","_count","_ent","_ownerID","_result","_valueNew","_prix","_min","_max","_seil","_evol","_entValue","_relation","_value","_name"];
uiSleep 5;
while {true} do {
    _ObjectLast = Bourse_ressource_Save;
    Sleep 30;
    _Object = Bourse_ressource_Save;
    if ((count _Object) != 0) then {
        //diag_log format["Save Object ==> Boucle d'ajout ==> %1",Bourse_ressource_Save];
        _Object2 = [];
        {
            _Sell = (_x select 1);
            _ressources = (_x select 0);
            _Id_Object2 = -1;
            //diag_log format["Save Object ==> Boucle d'ajout ==> ressources : %1 | Sell : %2",_ressources,_Sell];
            {
                _ressources_2 = (_x select 0);
                _Sell_2 = (_x select 1);
                //diag_log format["Save Object ==> Boucle d'ajout ==> ressources : %1 | Recherche de pressence",_ressources];
                if (_ressources == _ressources_2) exitWith {
                    //diag_log format["Save Object ==> Boucle d'ajout ==> ressources : %1 | Presente Recuperation de l'id",_ressources];
                    _Id_Object2  = (_Object2 find [_ressources,_Sell_2]);
                    //diag_log format["Save Object ==> Boucle d'ajout ==> ressources : %1 | ID : %2 dans Object2",_ressources,_Id_Object2];
                };
            } forEach _Object2;
            if (_Id_Object2 == -1) then {
                //diag_log format["Save Object ==> Boucle d'ajout ==> ressources : %1 | Sell : %3 | ID : %2",_ressources,_Id_Object2,_Sell];
                _Object2 pushBack [_ressources,_Sell];
            } else {
                //diag_log format["Save Object ==> Boucle d'ajout ==> ressources : %1 | Sell : %3 | ID : %2",_ressources,_Id_Object2,_Sell];
                _newValueArray = (((_Object2 select _Id_Object2) select 1) + _Sell);
                _Object2 set [_Id_Object2,[_ressources,_newValueArray]];
            };
            //diag_log format["Save Object ==> Boucle d'ajout ==> ressources : %1 | Array : %2",_ressources,_Object2];
        } forEach _Object;
        //diag_log format["Save Object ==> Array Object: %1",_Object2];
        {
            _ressource = (_x select 0);
            _count = (_x select 1);
            //diag_log format["Save Object ==> Boucle de modification ==> ressources : %1 | Count : %2",_ressource,_count];
            _Object_Bourse = Bourse_Object getVariable "Bourse";
            _result = [_x select 0] call bourse_fnc_ressources;
            _countArr = count _result;
            if (_countArr != 0) then {
                _valueNew = 0;
                _min = (_result select 0);
                _max = (_result select 1);
                _seil = (_result select 2);
                _evol = (_result select 3);
                _entValue = (_result select 5);
                _relation = (_result select 6);
                _value = {if (_ressource == (_x select 0)) exitWith {(_x select 1)}}forEach _Object_Bourse;
                //diag_log format["Save Object ==> Boucle de modification ==> ressources : %1 | Count : %2 | Min : %3 | Max : %4 | Seil : %5 | Evol : %6 | Ent Evol : %7 | Relation : %8",_ressource,_count,_min,_max,_seil,_evol,_entValue,_relation];
                if (_value >= _seil) then {
                    _valueNew = (_value - (_count * _evol));
                    //diag_log format["Save Object ==> Boucle de modification ==> Verification du seil ==> ressources : %1 | Value : %2 >= %3",_ressource,_value,_seil];
                } else {
                    _valueNew = (_value - (_count));
                    //diag_log format["Save Object ==> Boucle de modification ==> Verification du seil ==> ressources : %1 | Value : %2 < %3",_ressource,_value,_seil];
                };

                if (_value >= _max) then {
                    _valueNew = _max;
                    //diag_log format["Save Object ==> Boucle de modification ==> Verification du Max ==> ressources : %1 | Value : %2 >= %3",_ressource,_value,_max];
                };

                if (_value <= _min) then {
                    _valueNew = _min;
                    //diag_log format["Save Object ==> Boucle de modification ==> Verification du Min ==> ressources : %1 | Value : %2 <= %3",_ressource,_value,_min];
                };

                 //diag_log format["Save Object ==> Boucle de modification ==> ressources : %1 | Value : %2",_ressource,_value];

                _valueArray = [_ressource,_value];
                //diag_log format["Save Object ==> Boucle de modification ==> Encienne valeur ==> ressources : %1 | Array : %2",_ressource,_valueArray];
                _id = _Object_Bourse find _valueArray;
                //diag_log format["Save Object ==> Boucle de modification ==> Id de la valeur ==> ressources : %1 | Id : %2",_ressource,_id];
                _newValueArray = [_ressource,_valueNew];
                //diag_log format["Save Object ==> Boucle de modification ==> Nouvelle valeur ==> ressources : %1 | Array : %2",_ressource,_newValueArray];
                _Object_Bourse set [_id,_newValueArray];
                //diag_log format["Save Object ==> Boucle de modification ==> Set dans la bourse a l'id ==> ressources : %1 | Id : %2 | Array : %3",_ressource,_id,_newValueArray];
                {
                    _name = (_x select 0);
                    _cofi = (_x select 1);
                    _valueModif = _count * _cofi;
                    //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | Cof : %2 | Valur : %3",_name,_cofi,_valueModif];
                    {
                        if (_name == (_x select 0)) then {
                            _ValueArray = [_name,(_x select 1)];
                            //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | Trouver",_name];
                            //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | Array : %2",_name,_ValueArray];
                            _id = _Object_Bourse find _ValueArray;
                            //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | Id : %2",_name,_id];
                            _NewValueFor = ((_x select 1) + (_valueModif));
                            //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | New Value : %2",_name,_NewValueFor];
                            _resultFor = [_x select 0] call bourse_fnc_ressources;
                            _minFor = (_resultFor select 0);
                            _maxFor = (_resultFor select 1);
                            //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | Max : %2 | Min : %3",_name,_maxFor,_minFor];
                            if (round(_NewValueFor) > round(_maxFor)) then {
                                _NewValueFor = _maxFor;
                                //diag_log format["Save Object ==> Boucle de Relation ==> Verification du Max ==> ressources : %1 | Value : %2 >= %3",_name,_NewValueFor,_maxFor];
                            };

                            if (round(_NewValueFor) <= round(_minFor)) then {
                                _NewValueFor = _minFor;
                                //diag_log format["Save Object ==> Boucle de Relation ==> Verification du Min ==> ressources : %1 | Value : %2 <= %3",_name,_NewValueFor,_minFor];
                            };

                            _newValueArray = [_name,(_NewValueFor)];
                            //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | New Array : %2",_name,_newValueArray];
                            _Object_Bourse set [_id,_newValueArray];
                            //diag_log format["Save Object ==> Boucle de Relation ==> ressources : %1 | Set In Bourse",_name];
                        };
                    } forEach _Object_Bourse;
                } forEach _relation;
                //diag_log format["Save Object ==> Boucle de modification ==> End ==> Save In Bourse"];
                Bourse_Object setVariable ["Bourse",_Object_Bourse, true];
            };
        } forEach _Object2;
        //diag_log format["Save Object ==> End ==> Bourse : %1",_Object_Bourse];
        Bourse_ressource_Save = [];
    };
};