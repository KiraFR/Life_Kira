#include "..\..\macro.h"
/*
	File: fn_logs.sqf
	Author: 

	Description:
		<LOG_CONNECTION>true</LOG_CONNECTION>
		<LOG_DISCONNECTION>true</LOG_DISCONNECTION>
		<LOG_SUICIDES>true</LOG_SUICIDES>
		<LOG_CARKILLS>true</LOG_CARKILLS>
		<LOG_AIRKILLS>true</LOG_AIRKILLS>
		<LOG_KILLS>true</LOG_KILLS>
		<LOG_GIVEMONEY>true</LOG_GIVEMONEY>
		<LOG_ATMTRANSFERT>true</LOG_ATMTRANSFERT>
		<LOG_CHOPSHOPSELL>true</LOG_CHOPSHOPSELL>
		<LOG_VEHICLESBUY>true</LOG_VEHICLESBUY>
		<LOG_VEHICLESRENT>true</LOG_VEHICLESRENT>
		<LOG_VIRTBUY>true</LOG_VIRTBUY>
		<LOG_VIRTBUYGANG>true</LOG_VIRTBUYGANG>
		<LOG_VIRTSELL>true</LOG_VIRTSELL>
		<LOG_CLOTHBUY>true</LOG_CLOTHBUY>
		<LOG_BANKWITHDRAW>true</LOG_BANKWITHDRAW>
		<LOG_BANKDEPOSITE>true</LOG_BANKDEPOSITE>
		<LOG_GANGBANKWITHDRAW>true</LOG_GANGBANKWITHDRAW>
		<LOG_GANGBANKDEPOSITE>true</LOG_GANGBANKDEPOSITE>
		<LOG_WEAPONSELL>true</LOG_WEAPONSELL>
		<LOG_WEAPONBUY>true</LOG_WEAPONBUY>
		<LOG_WEAPONGANKBUY>true</LOG_WEAPONGANKBUY>
		<LOG_ROB>true</LOG_ROB>
		<LOG_TICKETGIVE>true</LOG_TICKETGIVE>
		<LOG_TICKETPAID>true</LOG_TICKETPAID>
		<LOG_JAIL>true</LOG_JAIL>
		<LOG_GARAGESELL>true</LOG_GARAGESELL>
		<LOG_JAILBAIL>true</LOG_JAILBAIL>
		<LOG_JAILESCAPE>true</LOG_JAILESCAPE>
		<LOG_JAILOVER>true</LOG_JAILOVER>
		<LOG_JAILSPAWN>true</LOG_JAILSPAWN>
		<LOG_BUYLICENSE>true</LOG_BUYLICENSE>
		<LOG_REVIVE>true</LOG_REVIVE>
		<LOG_RESPAWN>true</LOG_RESPAWN>
		<LOG_EXPLOSION>true</LOG_EXPLOSION>
		<LOG_COMPENSATE>true</LOG_COMPENSATE>
		<LOG_TELEPORT>true</LOG_TELEPORT>
		<LOG_TPHERE>true</LOG_TPHERE>
		<LOG_MARKER>true</LOG_MARKER>
		<LOG_GODMODE>true</LOG_GODMODE>
		<LOG_MONEYPICKUP>true</LOG_MONEYPICKUP>
		<LOG_INSURE>true</LOG_INSURE>
		<LOG_REPAIRACCEPTED>true</LOG_REPAIRACCEPTED>
		<LOG_HOUSESELL>true</LOG_HOUSESELL>
		<LOG_HOUSEBUY>true</LOG_HOUSEBUY>
		<LOG_MAC>true</LOG_MAC>
		<LOG_MANUALINTERPOL>true</LOG_MANUALINTERPOL>
		<LOG_TRAITEMENT>true</LOG_TRAITEMENT>
		<LOG_GOVRETRAIT>true</LOG_GOVRETRAIT>
		<LOG_GOVDEPOT>true</LOG_GOVDEPOT>
		<LOG_VEHFOUILLE>true</LOG_VEHFOUILLE>
	
	
	dans queryRequest:
	_list = [_queryResult select 1,_queryResult select 3,_queryResult select 2];
	
	//  UID , SIDE  , Informations , Type
      [_uid,civilian,_list,0] call DB_fnc_logs;
	


  */

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_type = [_this,3,-1,[0]] call BIS_fnc_param;


switch (_type) do { 
	case 0 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2) vient de se connecter en %3 | bank %4 | cash %5",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', 'Connexion', '%2')",_uid,_msg];
	};
	case 1 : {  
	
	}; 
	case 2 : {    

	}; 
	case 3 : {    

	}; 
	case 4 : {    

	}; 
	case 5 : {    

	}; 
	case 6 : {    

	}; 
	case 7 : {    

	}; 
	case 8 : {   

	}; 
	case 9 : {   

	}; 
	case 10 : {   

	}; 
	case 11 : {   

	}; 
	case 12 : {   

	}; 
	case 13 : {   

	}; 
	case 14 : {   

	}; 
	case 15 : {   

	}; 
	case 16 : {   

	}; 
	case 17 : {   

	}; 
	case 18 : {   

	}; 
	case 19 : {   

	}; 
	case 20 : {   

	}; 
	case 21 : {   

	}; 
	case 22 : {   

	}; 
	case 23 : {   

	}; 
	case 24 : {   

	}; 
	case 25 : {   

	}; 
	case 26 : {   

	}; 
	case 27 : {   

	}; 
	case 28 : {   

	}; 
	case 29 : {   

	}; 
	case 30 : {   

	}; 
	case 31 : {   

	}; 
	case 32 : {   

	}; 
	case 33 : {   

	}; 
	case 34 : {   

	}; 
	case 35 : {   

	}; 
	case 36 : {   

	}; 
	case 37 : {   

	}; 
	case 38 : {   

	}; 
	case 39 : {   

	}; 
	case 40 : {   

	}; 
	case 41 : {   

	}; 
	case 42 : {   

	}; 
	case 42 : {   

	}; 
	case 43 : {   

	}; 
	case 44 : {   

	}; 
	case 45 : {   

	}; 
	case 46 : {   

	}; 
	case 47 : {   

	}; 
	case 48 : {   

	}; 
	case 50 : {   

	}; 
	case 51 : {   

	}; 
};

[_query,1] call DB_fnc_asyncCall;