/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
uiSleep 5;
while{true} do {
    uiSleep (30);
    _query = "UPDATE bourse SET valeur = CASE";
    _Object = Bourse_Object getVariable "Bourse";
    {
        _str = format[" WHEN name = '""%2""' THEN '%1'",_x select 1,_x select 0];
        _query = _query +_str;
    }forEach _Object;
    _query = _query + " END";
    [_query,1] call DB_fnc_asyncCall;
};
