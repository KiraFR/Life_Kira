/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
private["_Object"];
uiSleep 5;
while{true} do {
    _Object = Bourse_Object getVariable "Bourse";
    _gouv = Bourse_Object getVariable "MontantGouvernement";
    uiSleep 150; // 2m 30s
    _query = "UPDATE bourse SET valeur = CASE";
    {
       _str = format[" WHEN name = '""%2""' THEN '%1'",_x select 1,_x select 0];
       _query = _query +_str;
    }forEach _Object;
    _query = _query + " END;" + format["UPDATE banque SET bankacc=bankacc+%1 WHERE numcompte='GD0000001'",_gouv];
    [_query,1] call DB_fnc_asyncCall;
};