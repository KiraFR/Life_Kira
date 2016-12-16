/*
	File: fn_logs.sqf
	Author: 

	Description:
		<LOG_CONNECTION>true</LOG_CONNECTION> fait
		<LOG_DISCONNECTION>true</LOG_DISCONNECTION> fait
		<LOG_SUICIDES>true</LOG_SUICIDES> fait
		<LOG_CARKILLS>true</LOG_CARKILLS> fait
		<LOG_AIRKILLS>true</LOG_AIRKILLS> fait
		<LOG_KILLS>true</LOG_KILLS> fait
		<LOG_GIVEMONEY>true</LOG_GIVEMONEY> fait
		<LOG_ATMTRANSFERT>true</LOG_ATMTRANSFERT> fait
		<LOG_CHOPSHOPSELL>true</LOG_CHOPSHOPSELL>
		<LOG_VEHICLESBUY>true</LOG_VEHICLESBUY> fait
		<LOG_VEHICLESRENT>true</LOG_VEHICLESRENT> fait
		<LOG_VIRTBUY>true</LOG_VIRTBUY> fait
		<LOG_VIRTBUYGANG>true</LOG_VIRTBUYGANG> fait
		<LOG_VIRTSELL>true</LOG_VIRTSELL> fait
		<LOG_CLOTHBUY>true</LOG_CLOTHBUY> fait
		<LOG_BANKWITHDRAW>true</LOG_BANKWITHDRAW> fait
		<LOG_BANKDEPOSITE>true</LOG_BANKDEPOSITE> fait
		<LOG_GANGBANKWITHDRAW>true</LOG_GANGBANKWITHDRAW> fait
		<LOG_GANGBANKDEPOSITE>true</LOG_GANGBANKDEPOSITE> fait
		<LOG_WEAPONSELL>true</LOG_WEAPONSELL> fait 
		<LOG_WEAPONBUY>true</LOG_WEAPONBUY> fait
		<LOG_WEAPONGANKBUY>true</LOG_WEAPONGANKBUY> fait
		<LOG_ROB>true</LOG_ROB> fait
		<LOG_JAIL>true</LOG_JAIL> fait
		<LOG_GARAGESELL>true</LOG_GARAGESELL> fait
		<LOG_JAILESCAPE>true</LOG_JAILESCAPE> fait
		<LOG_JAILOVER>true</LOG_JAILOVER> fait
		<LOG_JAILSPAWN>true</LOG_JAILSPAWN> fait
		<LOG_BUYLICENSE>true</LOG_BUYLICENSE> fait
		<LOG_REVIVE>true</LOG_REVIVE> fait
		<LOG_RESPAWN>true</LOG_RESPAWN> fait
		<LOG_MONEYPICKUP>true</LOG_MONEYPICKUP> fait
		<LOG_INSURE>true</LOG_INSURE> fait
		<LOG_REPAIRACCEPTED>true</LOG_REPAIRACCEPTED>
		<LOG_HOUSESELL>true</LOG_HOUSESELL>
		<LOG_HOUSEBUY>true</LOG_HOUSEBUY>
		<LOG_MAC>true</LOG_MAC>
		<LOG_MANUALINTERPOL>true</LOG_MANUALINTERPOL>
		<LOG_TRAITEMENT>true</LOG_TRAITEMENT>
		<LOG_GOVRETRAIT>true</LOG_GOVRETRAIT>
		<LOG_GOVDEPOT>true</LOG_GOVDEPOT>
		<LOG_VEHFOUILLE>true</LOG_VEHFOUILLE>
*/

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_type = [_this,3,-1,[0]] call BIS_fnc_param;


switch (_type) do { 
	case 0 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2) vient de se connecter en %3 | bank %4 | cash %5.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Connexion', '%2')",_uid,_msg];
	};
	case 1 : {  
		_data = [_this,2,"",[""]] call BIS_fnc_param;
		_msg = format["%1(%2) vient de se deconnecter.",_data,_uid];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Deconnexion', '%2')",_uid,_msg];
	}; 
	case 2 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se suicider en %4.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Suicide', '%2')",_uid,_msg];
	}; 
	case 3 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se faire tuer en %4 par le un vehicule(%5) de %6(%7)(%8) en %9.",_data select 0,_uid,_side,_data select 1,_data select 6,_data select 2,_data select 3,_data select 4,_data select 5];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Car Kill', '%2')",_uid,_msg,_data select 3];
	}; 
	case 4 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se faire tuer en %4 par le un vehicule Aerien(%5) de %6(%7)(%8) en %9.",_data select 0,_uid,_side,_data select 1,_data select 6,_data select 2,_data select 3,_data select 4,_data select 5];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Air Kill', '%2')",_uid,_msg,_data select 3];
	}; 
	case 5 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se faire tuer en %4 par %5(%6)(%7) en %8 avec une arme(%9) à une distance de %10.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4,_data select 5,_data select 6,_data select 7];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Kill', '%2')",_uid,_msg,_data select 3];
	}; 
	case 6 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient donner %4 euros a %5(%6)(%7).",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Donner Cash', '%2')",_uid,_msg,_data select 3];
	}; 
	case 7 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de faire un virement de %4 euros a %5(%6)(%7).",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Virement Banquaire', '%2')",_uid,_msg,_data select 3];
	}; 
	case 8 : {   
		//chopshop
	}; 
	case 9 : {   
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter un(e) %4(%5) ayant la couleur %6 a un prix de %6.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Achat Veh', '%2')",_uid,_msg];
	}; 
	case 10 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de louer un(e) %4(%5) ayant la couleur %6 a un prix de %6.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Location Veh', '%2')",_uid,_msg];
	}; 
	case 11 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4 %5s pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Achat Virt', '%2')",_uid,_msg];
	}; 
	case 12 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4 %5s pour %6 euros avec le compte en banque du Gang %7.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Achat Virt Gang', '%2')",_uid,_msg];
	}; 
	case 13 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de vendre %4 %5s pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Vente Virt', '%2')",_uid,_msg];
	}; 
	case 14 : {  		
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4(%5) pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Achat vetement', '%2')",_uid,_msg];
	}; 
	case 15 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de retirer %4 euros.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Withdraw', '%2')",_uid,_msg];
	}; 
	case 16 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de deposer %4 euros.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Deposit', '%2')",_uid,_msg];
	}; 
	case 17 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de retirer %4 euros dans le compte du gang %5.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'GangWithdraw', '%2')",_uid,_msg];
	}; 
	case 18 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de deposer %4 euros dans le compte du gang %5.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'GangDeposit', '%2')",_uid,_msg];
	}; 
	case 19 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de vendre un(e) %4(%5) pour %6 euros .",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Vente Arme', '%2')",_uid,_msg];
	}; 
	case 20 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter un(e) %4(%5) pour %6 euros .",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Achat Arme', '%2')",_uid,_msg];
	}; 
	case 21 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter un(e) %4(%5) pour %6 euros avec le compte du gang %7.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Achat Arme Gang', '%2')",_uid,_msg];
	}; 
	case 22 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de voler %4 euros a %5(%6)(%7).",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Vole', '%2')",_uid,_msg,_data select 3];
	}; 
	case 23 : {

	}; 
	case 24 : {   

	}; 
	case 25 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de mettre %4(%5)(%6) en prison.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Vole', '%2')",_uid,_msg,_data select 2];
	};
	case 26 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de mettre %4(%5)(%6) en prison.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Vole', '%2')",_uid,_msg,_data select 2];
	}; 
	case 27 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de s'echapper de prison.",_data select 0,_uid,_side];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Escape Jail', '%2')",_uid,_msg];
	}; 
	case 28 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de sortir de prison.",_data select 0,_uid,_side];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Sortie Jail', '%2')",_uid,_msg];
	}; 
	case 29 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) retourne en prison apres une reconnexion.",_data select 0,_uid,_side];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Jail reco', '%2')",_uid,_msg];
	}; 
	case 30 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4(%5) pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Achat Licence', '%2')",_uid,_msg];
	}; 
	case 31 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'etre revive par %4(%5)(%6)",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO LOG (PID, PID2, Type, Text) VALUES('%1', '%3', 'Revive', '%2')",_uid,_msg,_data select 2];
	}; 
	case 32 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de respawn.",_data select 0,_uid,_side];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'Respawn', '%2')",_uid,_msg];
	}; 
	case 33 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de ramasser %4 euros par terre en %5",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO LOG (PID, Type, Text) VALUES('%1', 'PickUp Money', '%2')",_uid,_msg];
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