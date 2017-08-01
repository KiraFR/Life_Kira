#include "\life_server\script_macros.hpp"
/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_return","_all","_query","_queryResult","_return","_str","_queryResultGouv"];

_all = ["Name"] call bourse_fnc_ressources;
_query = "SELECT name,valeur FROM bourse";
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if (count _queryResult == 0) then {

    _query = "INSERT INTO bourse (name, valeur) VALUES";
    _Object = [];
    _count = 0;
    {
        _return = [_x] call bourse_fnc_ressources;
        if(count _return != 0) then{
            _str = format[" ('""%2""','%1')",(_return select 4),_x];

            if (_count != 0) then {
                _query = _query + "," +_str;
            }else{
                _query = _query +_str;
            };

            _Object = _Object + [_x,_return];
            _count = _count + 1;
        };
    }forEach _all;
    _query = _query + ";";
    [_query,1] call DB_fnc_asyncCall;

    _query = "SELECT name,valeur FROM bourse";
    _queryResult = [_query,2,true] call DB_fnc_asyncCall;
};
_queryGouv = "SELECT bankacc FROM banque WHERE numcompte='GD0000001';";
_queryResultGouv = [_queryGouv,2] call DB_fnc_asyncCall;
if(typeName _queryResultGouv == "ARRAY") then{
    _queryResultGouv = _queryResultGouv select 0;
    if(typeName _queryResultGouv == "STRING")then{
        _queryResultGouv = parseNumber(_queryResultGouv);
    };
};
Bourse_Object setVariable ["MontantGouvernement",_queryResultGouv];
Bourse_Object setVariable ["Bourse",_queryResult];
Bourse_ressource_Save = [];
Bourse_Start = true;
