private ["_query","_queryResult","_gesuchter"];
_query = "SELECT list,id from wanted";
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
{life_wanted_list = _x select 0;} forEach _queryResult;