/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
uiSleep 5;
while{true} do {
    _ObjectLast = Bourse_Object getVariable "Bourse";
    Sleep 60; // 1m
    _Object = Bourse_Object getVariable "Bourse";
    if (!(_ObjectLast isEqualTo _Object)) then {
         _query = "UPDATE bourse SET valeur = CASE";
         {
            _str = format[" WHEN name = '""%2""' THEN '%1'",_x select 1,_x select 0];
            _query = _query +_str;
         }forEach _Object;
         _query = _query + " END";
         [_query,1] call DB_fnc_asyncCall;
         diag_log format["---- Save Bourse ! -----"];
         diag_log format["%1",_query];
    };
};