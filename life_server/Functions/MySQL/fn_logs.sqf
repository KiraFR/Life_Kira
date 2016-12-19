/*
	File: fn_logss.sqf
	Author: 

	Description:
		<logs_CONNECTION>true</logs_CONNECTION> fait
		<logs_DISCONNECTION>true</logs_DISCONNECTION> fait
		<logs_SUICIDES>true</logs_SUICIDES> fait
		<logs_CARKILLS>true</logs_CARKILLS> fait
		<logs_AIRKILLS>true</logs_AIRKILLS> fait
		<logs_KILLS>true</logs_KILLS> fait
		<logs_GIVEMONEY>true</logs_GIVEMONEY> fait
		<logs_ATMTRANSFERT>true</logs_ATMTRANSFERT> fait
		<logs_CHOPSHOPSELL>true</logs_CHOPSHOPSELL>
		<logs_VEHICLESBUY>true</logs_VEHICLESBUY> fait
		<logs_VEHICLESRENT>true</logs_VEHICLESRENT> fait
		<logs_VIRTBUY>true</logs_VIRTBUY> fait
		<logs_VIRTBUYGANG>true</logs_VIRTBUYGANG> fait
		<logs_VIRTSELL>true</logs_VIRTSELL> fait
		<logs_CLOTHBUY>true</logs_CLOTHBUY> fait
		<logs_BANKWITHDRAW>true</logs_BANKWITHDRAW> fait
		<logs_BANKDEPOSITE>true</logs_BANKDEPOSITE> fait
		<logs_GANGBANKWITHDRAW>true</logs_GANGBANKWITHDRAW> fait
		<logs_GANGBANKDEPOSITE>true</logs_GANGBANKDEPOSITE> fait
		<logs_WEAPONSELL>true</logs_WEAPONSELL> fait 
		<logs_WEAPONBUY>true</logs_WEAPONBUY> fait
		<logs_WEAPONGANKBUY>true</logs_WEAPONGANKBUY> fait
		<logs_ROB>true</logs_ROB> fait
		<logs_JAIL>true</logs_JAIL> fait
		<logs_GARAGESELL>true</logs_GARAGESELL> fait
		<logs_JAILESCAPE>true</logs_JAILESCAPE> fait
		<logs_JAILOVER>true</logs_JAILOVER> fait
		<logs_JAILSPAWN>true</logs_JAILSPAWN> fait
		<logs_BUYLICENSE>true</logs_BUYLICENSE> fait
		<logs_REVIVE>true</logs_REVIVE> fait
		<logs_RESPAWN>true</logs_RESPAWN> fait
		<logs_MONEYPICKUP>true</logs_MONEYPICKUP> fait
		<logs_INSURE>true</logs_INSURE> fait
		<logs_REPAIRACCEPTED>true</logs_REPAIRACCEPTED>
		<logs_HOUSESELL>true</logs_HOUSESELL> fait
		<logs_HOUSEBUY>true</logs_HOUSEBUY> fait
		<logs_MAC>true</logs_MAC>
		<logs_MANUALINTERPOL>true</logs_MANUALINTERPOL>
		<logs_TRAITEMENT>true</logs_TRAITEMENT> fait
		<logs_GOVRETRAIT>true</logs_GOVRETRAIT>
		<logs_GOVDEPOT>true</logs_GOVDEPOT>
		<logs_VEHFOUILLE>true</logs_VEHFOUILLE> fait
*/

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_type = [_this,3,-1,[0]] call BIS_fnc_param;


switch (_type) do { 
	case 0 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2) vient de se connecter en %3 | bank %4 | cash %5.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', 'Connexion', '""%2""')",_uid,_msg];
	};
	case 1 : {  
		_data = [_this,2,"",[""]] call BIS_fnc_param;
		_msg = format["%1(%2) vient de se deconnecter.",_data,_uid];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Deconnexion""', '""%2""')",_uid,_msg];
	}; 
	case 2 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se suicider en %4.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Suicide""', '""%2""')",_uid,_msg];
	}; 
	case 3 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se faire tuer en %4 par le un vehicule(%5) de %6(%7)(%8) en %9.",_data select 0,_uid,_side,_data select 1,_data select 6,_data select 2,_data select 3,_data select 4,_data select 5];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Car Kill""', '""%2""')",_uid,_msg,_data select 3];
	}; 
	case 4 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se faire tuer en %4 par le un vehicule Aerien(%5) de %6(%7)(%8) en %9.",_data select 0,_uid,_side,_data select 1,_data select 6,_data select 2,_data select 3,_data select 4,_data select 5];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Air Kill""', '""%2""')",_uid,_msg,_data select 3];
	}; 
	case 5 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se faire tuer en %4 par %5(%6)(%7) en %8 avec une arme(%9) à une distance de %10.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4,_data select 5,_data select 6,_data select 7];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Kill""', '""%2""')",_uid,_msg,_data select 3];
	}; 
	case 6 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient donner %4 euros a %5(%6)(%7).",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Donner Cash""', '""%2""')",_uid,_msg,_data select 3];
	}; 
	case 7 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de faire un virement de %4 euros a %5(%6)(%7).",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Virement Banquaire""', '""%2""')",_uid,_msg,_data select 3];
	}; 
	case 8 : {   
		//chopshop
	}; 
	case 9 : {   
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter un(e) %4(%5) ayant la couleur %6 a un prix de %6.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat Veh""', '""%2""')",_uid,_msg];
	}; 
	case 10 : {  
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de louer un(e) %4(%5) ayant la couleur %6 a un prix de %6.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Location Veh""', '""%2""')",_uid,_msg];
	}; 
	case 11 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4 %5s pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat Virt""', '""%2""')",_uid,_msg];
	}; 
	case 12 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4 %5s pour %6 euros avec le compte en banque du Gang %7.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat Virt Gang""', '""%2""')",_uid,_msg];
	}; 
	case 13 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de vendre %4 %5s pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Vente Virt""', '""%2""')",_uid,_msg];
	}; 
	case 14 : {  		
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4(%5) pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat vetement""', '""%2""')",_uid,_msg];
	}; 
	case 15 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de retirer %4 euros.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Withdraw""', '""%2""')",_uid,_msg];
	}; 
	case 16 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de deposer %4 euros.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Deposit""', '""%2""')",_uid,_msg];
	}; 
	case 17 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de retirer %4 euros dans le compte du gang %5.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""GangWithdraw""', '""%2""')",_uid,_msg];
	}; 
	case 18 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de deposer %4 euros dans le compte du gang %5.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""GangDeposit""', '""%2""')",_uid,_msg];
	}; 
	case 19 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de vendre un(e) %4(%5) pour %6 euros .",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Vente Arme""', '""%2""')",_uid,_msg];
	}; 
	case 20 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter un(e) %4(%5) pour %6 euros .",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat Arme""', '""%2""')",_uid,_msg];
	}; 
	case 21 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter un(e) %4(%5) pour %6 euros avec le compte du gang %7.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat Arme Gang""', '""%2""')",_uid,_msg];
	}; 
	case 22 : { 
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de voler %4 euros a %5(%6)(%7).",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3,_data select 4];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Vole""', '""%2""')",_uid,_msg,_data select 3];
	}; 
	case 23 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se donner %4 euros.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Compensate""', '""%2""')",_uid,_msg];
	}; 
	case 24 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de se teleporter sur la position %4.",_data select 0,_uid,_side,_data select 1];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Teleporte""', '""%2""')",_uid,_msg];
	}; 
	case 25 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de mettre %4(%5)(%6) en prison.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Vole""', '""%2""')",_uid,_msg,_data select 2];
	};
	case 26 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de mettre %4(%5)(%6) en prison.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Vole""', '""%2""')",_uid,_msg,_data select 2];
	}; 
	case 27 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de s'echapper de prison.",_data select 0,_uid,_side];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Escape Jail""', '""%2""')",_uid,_msg];
	}; 
	case 28 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de sortir de prison.",_data select 0,_uid,_side];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Sortie Jail""', '""%2""')",_uid,_msg];
	}; 
	case 29 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) retourne en prison apres une reconnexion.",_data select 0,_uid,_side];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Jail reco""', '""%2""')",_uid,_msg];
	}; 
	case 30 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter %4(%5) pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat Licence""', '""%2""')",_uid,_msg];
	}; 
	case 31 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'etre revive par %4(%5)(%6)",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Revive""', '""%2""')",_uid,_msg,_data select 2];
	}; 
	case 32 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de respawn.",_data select 0,_uid,_side];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Respawn""', '""%2""')",_uid,_msg];
	}; 
	case 33 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de ramasser %4 euros par terre en %5",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""PickUp Money""', '""%2""')",_uid,_msg];
	}; 
	case 34 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'assurer %4(%5) pour %6 euros.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Insure""', '""%2""')",_uid,_msg];
	}; 
	case 35 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de vendre sa maison en %4 pour %5 euros.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Sell House""', '""%2""')",_uid,_msg];
	}; 
	case 36 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient d'acheter une maison en %4 pour %5 euros.",_data select 0,_uid,_side,_data select 1,_data select 2];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Achat House""', '""%2""')",_uid,_msg];
	}; 
	case 37 : {   

	}; 
	case 38 : {   

	}; 
	case 39 : {    
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de traiter %4 %5 en %6.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, Type, Text) VALUES('%1', '""Traitement""', '""%2'"")",_uid,_msg];
	}; 
	case 40 : {   

	}; 
	case 41 : {   

	}; 
	case 42 : {
		_data = [_this,2,[],[[]]] call BIS_fnc_param;
		_msg = format["%1(%2)(%3) vient de regarder dans le vehicule %4(%5) qui est un(e) %6.",_data select 0,_uid,_side,_data select 1,_data select 2,_data select 3];
		_query = format["INSERT INTO logs (PID, PID2, Type, Text) VALUES('%1', '%3', '""Check Vehicule""', '""%2""')",_uid,_msg,_data select 2]; 
	}; 
};
diag_log _query;
[_query,1] call DB_fnc_asyncCall;