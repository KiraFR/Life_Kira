/*
    File: fn_calculatePrice.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
private["_Price"];
params["_type"];
ctrlShow[5000,false];
_Price = 150000;

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

Switch(_type) do{
	case 0: {hint "Vous devez cocher au moins une case";};

	case 1: {_Price*1.5;
		//BLUFOR
		if (playerSide==west) then {_Price*2;};
		//Gouvernement
		if (license_civ_gouv) then {_Price*2.5;};
		};

	case 2: {_Price*2;
		//BLUFOR
		if (playerSide==west) then {_Price*2.5;};
		//Gouvernement
		if (license_civ_gouv) then {_Price*3;};
		};
	case 3: {_Price*1.25;
		//BLUFOR
		if (playerSide==west) then {_Price*1.75;};
		//Gouvernement
		if (license_civ_gouv) then {_Price*2;};
		};
};