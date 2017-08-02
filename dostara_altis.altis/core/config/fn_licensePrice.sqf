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
	case "driver": {(500 * (life_nbrFoisPermis + 1))};
	case "boat": {1000}; //Boating license cost
	case "pilot": {20000}; //Pilot/air license cost
	case "gun": {3600}; //Firearm/gun license cost
	case "dive": {400}; //Diving license cost
	case "oil": {2600}; //Oil processing license cost
	case "cair": {20000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {25000}; //Heroin processing license cost
	case "marijuana": {19500}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {75000}; //Rebel license cost
	case "truck": {(20000 * (life_nbrFoisPermis + 1))};
	case "diamond": {4350};
	case "salt": {12000};
	case "cocaine": {30000};
	case "sand": {460};
	case "iron": {690};
	case "copper": {570};
	case "cement": {1600};
	case "mair": {15000};
	case "home": {100};
	case "opium": {150000};
	case "vin": {1000};
	case "pprecieuse": {3240};
	case "fonderie": {800};
	case "fonderieExp": {4300};
	case "chaux": {430};
	case "presseur": {230};
	case "fishsoup": {500};
	case "acier": {2300};
	case "fermenta": {1000};
	case "silver": {2400};
    case "aluminium": {1100};
};
