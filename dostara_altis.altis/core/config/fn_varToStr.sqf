/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items

    case "life_inv_orange" : {"Orange"};
    case "life_inv_peche" : {"Peche"};
    case "life_inv_eau" : {"Bouteille d'eau"};
    case "life_inv_Jus_Multifruit" : {"Jus Multisfruits"};
    case "life_inv_wrap" : {"Wrap Poulet"};
    case "life_inv_burger" : {"Big Burger"};
    case "life_inv_soda" : {"Soda Extra Energy Drink"};
    case "life_inv_seau" : {"Seau"};
    case "life_inv_pelle" : {"Pelle"};
    case "life_inv_pioche" : {"Pioche"};
    case "life_ressource_pommes" : {"Pommes"};
    case "life_ressource_raisin" : {"Raisin"};
    case "life_ressource_jus_pomme" : {"Jus de pommes"};
    case "life_ressource_jus_raisin" : {"Jus de raisin"};
    case "life_ressource_cidre" : {"Cidre"};
    case "life_ressource_vin" : {"Vin"};
    case "life_ressource_biere" : {"Biere"};
    case "life_ressource_whisky" : {"Whisky"};
    case "life_ressource_cafe" : {"Cafe"};
    case "life_ressource_tabac" : {"Tabac"};
    case "life_ressource_saupe" : {"Saupe"};
    case "life_ressource_girelle" : {"Girelle"};
    case "life_ressource_maquereau" : {"Maquereau"};
    case "life_ressource_thon" : {"Thon"};
    case "life_ressource_mulet" : {"Mulet"};
    case "life_ressource_roussette" : {"Roussette"};
    case "life_ressource_soupe_poisson" : {"Soupe de poisson"};
    case "life_ressource_aluminium" : {"Aluminium"};
    case "life_ressource_argent" : {"Argent"};
    case "life_ressource_bois" : {"Bois"};
    case "life_ressource_charbons" : {"Charbons"};
    case "life_ressource_chaux" : {"Chaux"};
    case "life_ressource_cuivre" : {"Cuivre"};
    case "life_ressource_fer" : {"Fer"};
    case "life_ressource_petrole" : {"Petrole"};
    case "life_ressource_pierres_precieuses" : {"Pierres Precieuses"};
    case "life_ressource_sable" : {"Sable"};
    case "life_ressource_sel" : {"Sel"};
    case "life_ressource_verre" : {"Verre"};
    case "life_ressource_acier" : {"Acier"};
    case "life_ressource_bijoux" : {"Bijoux"};
    case "life_ressource_ciment" : {"Ciment"};
    case "life_ressource_essence" : {"Essence"};
    case "life_ressource_cannabis" : {"Cannabis"};
    case "life_ressource_coca" : {"Coca"};
    case "life_ressource_opium" : {"Opium"};
    case "life_ressource_cocaine" : {"Cocaine"};
    case "life_ressource_heroine" : {"Heroine"};
    case "life_ressource_shit" : {"Shit"};
    case "life_ressource_meth" : {"Meth"};
    case "life_ressource_pharmceutique" : {"Pharmaceutique"};
    case "life_ressource_speedball" : {"Speed Ball"};
    case "life_ressource_tortue" : {"Tortue"};
    case "life_ressource_calcaire" : {"Calcaire"};
    case "life_ressource_aluminium_brut" : {"Aluminium Brut"};
    case "life_ressource_argent_brut" : {"Argent Brut"};
    case "life_ressource_cuivre_brut" : {"Cuivre Brut"};
    case "life_ressource_fer_brut" : {"Fer Brut"};

    case "life_inv_grand_coffre" : {"Grand Coffre"};
    case "life_inv_petit_coffre" : {"Petit Coffre"};
    case "life_inv_herse" : {"Herse"};
    case "life_inv_outil_crochetage" : {"Outil de crochetage"};



	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_gdo": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
    case "license_cop_prefet": {"Prefet"};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_Terroristes": {"Terroriste"};
	case "license_civ_petiteF": {"Petite Frappe"};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_opium": {(localize "STR_License_Opium")};
	case "licence_civ_gouv": {(localize "STR_License_Gouv")};
	case "licence_cop_Prefet": {(localize "STR_License_Prefet")};
    case "licence_civ_ebou": {(localize "STR_License_Ebou")};
	case "licence_civ_vin": {(localize "STR_License_Vin")};

	//New License

	case "license_civ_acier": {(localize "STR_License_Acier")};
	case "license_civ_pprecieuse": {"Taille de pierre precieuse"};
	case "license_civ_diamond": {(localize "STR_License_Diamond")}; // Bijoux
	case "licence_civ_fonderie": {(localize "STR_License_Fonderie")};
	case "licence_civ_fonderieExp": {(localize "STR_License_FonderieExp")};
	case "licence_civ_chaux": {(localize "STR_License_Usine")};
	case "license_civ_presseur": {"Justificatif Pressoir"};
	case "licence_civ_fermenta": {(localize "STR_License_Cidre")};
	case "licence_civ_fishsoup": {"Licence Soupe de poisson"};
};
