/*
    File: fn_SumContract.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
private["_name","_job","_price","_type"];
_type = _this;
_uid = getPlayerUID player;

if (_type == 99) then {
	_checkKidnapping = cbChecked (findDisplay 5000 displayCtrl 5007);
	_checkMurd = cbChecked (findDisplay 5000 displayCtrl 5009);
	_checkHarass = cbChecked (findDisplay 5000 displayCtrl 5011);

	//Verification
	if ((_checkKidnapping && _checkMurd) OR (_checkKidnapping && _checkHarass) OR 
		(_checkMurd && _checkKidnapping) OR (_checkMurd && _checkHarass) OR 
		(_checkHarass && _checkKidnapping) OR (_checkHarass && _checkMurd)) exitWith {
		hint "Merci de cocher qu'une seule case";
	};

	// Pas possible
	if (!_checkKidnapping && !_checkMurd && !_checkHarass) then {_type = 0;};
	// Kidnapping
	if (_checkKidnapping) then {_type = 1};
	//ASSASINAT
	if (_checkMurd) then {_type = 2;};
	//Harcelement
	if (_checkHarass) then {_type = 3;};
};

switch (_type) do {

	//kidnapping
	case 1: {
		_name = ctrlText 5002;
		_job = ctrlText 5004;
		_type = "Kidnapping";
		_side = if (PlayerSide == west) then{_side = "BLUFOR"}else { if (license_civ_gouv)then {_side = "gouv"};};
		_price = call life_fnc_calcualtePrice;
		[_uid,_job,_name,_price,_type,_side] remoteExecCall ["ASSA_fnc_ContratKid",2];
	};

	//normal
	case 2: {
		_name = ctrlText 5002;
		_job = ctrlText 5004;
		_type = "Assassinat";
		_side = if (PlayerSide == west) then{_side = "BLUFOR"}else { if (license_civ_gouv)then {_side = "gouv"};};
		_price = call life_fnc_calcualtePrice;
		[_uid,_job,_name,_price,_type,_side] remoteExecCall ["ASSA_fnc_ContratMurd",2];
		
	};

	//harcelemnt
	case 3: {
		_name = ctrlText 5002;
		_job = ctrlText 5004;
		_type = "Harcelement";
		_side = if (PlayerSide == west) then{_side = "BLUFOR"}else { if (license_civ_gouv)then {_side = "gouv"};};
		_price = call life_fnc_calcualtePrice;
		[_uid,_job,_name,_price,_type,_side] remoteExecCall ["ASSA_fnc_ContratHarass",2];
	};
};