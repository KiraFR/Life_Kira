/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": { //Drivers License cost
		if(!(missionNamespace getVariable "license_civ_truck") && !(missionNamespace getVariable "license_civ_driver")) then{
			500 * (life_nbrFoisPermis + 1)
		}else{
			500 * life_nbrFoisPermis
		};
	};
	case "boat": {500}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {10000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {25000}; //Heroin processing license cost
	case "marijuana": {19500}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {75000}; //Rebel license cost
	case "truck": { //Truck license cost
		if(!(missionNamespace getVariable "license_civ_truck") && !(missionNamespace getVariable "license_civ_driver")) then{
			20000 * (life_nbrFoisPermis + 1)
		}else{
			20000 * life_nbrFoisPermis
		};
	};
	case "diamond": {4350};
	case "salt": {12000};
	case "cocaine": {30000};
	case "sand": {460};
	case "iron": {690};
	case "copper": {570};
	case "cement": {1600};
	case "mair": {15000};
	case "home": {75000};
	case "opium": {150000};
	case "cidre": {1000};
	case "vin": {1000};
	case "PPrecieuse": {3240};
	case "fonderie": {800};
	case "fonderieExp": {4300};
	case "Chaux": {430};
	case "presseur": {230};
	case "fishsoup": {500};
	case "Acier": {2300};

};
