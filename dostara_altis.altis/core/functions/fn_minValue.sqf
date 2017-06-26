_recette = param[0,[],[[]]];
_bon = true;
_min = 50;
{
	_rscNameRec = _x select 0;
	_rscNb = _x select 1;
	_rscNbPossede = missionNamespace getVariable ([_rscNameRec,0] call life_fnc_varHandle);
	if(_rscNbPossede == 0)exitWith{_bon = false;};
	_value = floor(_rscNbPossede/_rscNb);
	if(_value < _min))then{_min = _value;};
}foreach _recette;

[_bon,_min];