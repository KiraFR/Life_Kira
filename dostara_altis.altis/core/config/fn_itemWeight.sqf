/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	default {1};

	case "Orange" : {1};
	case "Peche": {1};
	case "Bouteille_d_eau": {1};
	case "Jus_Multifruit" : {1};
	case "Herse": {4};
	case "Wrap_Poulet": {1};
    case "Big_Burger": {1};
    case "Soda_Extra_Energy_Drink": {1};
    case "Seau": {2};
    case "Pelle": {2};
    case "Pioche": {2};
    case "Pommes": {1};
    case "Raisin": {1};
    case "Jus_de_pommes": {1};
    case "Jus_de_raisin": {1};
    case "Cidre": {1};
    case "Vin": {1};
    case "Biere": {1};
    case "Whisky": {1};
    case "Cafe": {1};
    case "Tabac": {1};
    case "Saupe": {1};
    case "Girelle": {1};
    case "Maquereau": {2};
    case "Mulet": {2};
    case "Thon": {3};
    case "Roussette": {3};
    case "Soupe_de_poisson": {1};
    case "Aluminium" : {2};
    case "Aluminium_Brut" : {3};
    case "Argent" : {1};
    case "Argent_Brut" : {3};
    case "Bois" : {5};
    case "Charbons" : {2};
    case "Chaux" : {1};
    case "Calcaire" : {2};
    case "Cuivre" : {2};
    case "Cuivre_Brut" : {3};
    case "Fer" : {2};
    case "Fer_Brut" : {4};
    case "Petrole" : {2};
    case "Pierres_Precieuses" : {1};
    case "Pierres_Precieuses_Brut" : {2};
    case "Sable" : {2};
    case "Sel" : {1};
    case "Verre" : {2};
    case "Acier" : {5};
    case "Bijoux" : {2};
    case "Ciment" : {3};
    case "Essence" : {1};
    case "Cannabis" : {1};
    case "Coca" : {1};
    case "Opium" : {1};
    case "Cocaine" : {1};
    case "Heroine" : {1};
    case "Shit" : {1};
    case "Meth" : {1};
    case "Pharmaceutique" : {1};
    case "Speed_Ball" : {1};
    case "Tortue" : {3};
    case "harpon" : {4};
    case "Hache" : {4};
    case "filet_a" : {2};
    case "filet_p" : {3};
    case "filet_e" : {5};
};
