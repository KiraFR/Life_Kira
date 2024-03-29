/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop","_res"];
_shop = _this select 0;

switch (_shop) do
{
	case "marche": {["Marché",["Orange","Peche","Pommes","Raisin","Bouteille_d_eau","Jus_de_raisin","Jus_de_pommes","Jus_Multifruit","Wrap_Poulet","Big_Burger","Soda_Extra_Energy_Drink","Soupe_de_poisson"]]};
	case "cop": {["Marché Police",["Cafe","Herse","Bouteille_d_eau","Essence"]]};
	case "outillage": {

		_res = ["Seau","Pelle","Pioche","harpon"];
		if(license_civ_dive)then{
			_res = _res + ["filet_a","filet_p","filet_e"];
		};

		["Outillage",_res]
	};
	case "Export_luxe": {["Export Luxe",["Argent","Pierres_Precieuses","Bijoux"]]};
	case "Export_Combustible": {["Export de Combustible ",["Bois","Charbons","fuelF","oil"]]};
	case "Export_Metallurgie": {["Export de Metallurgie ",["Fer","Cuivre","Aluminium","Acier"]]};
	case "Caviste" : {["Caviste",["Cidre","Vin"]]};
	//case "Brasseur" : {["Brasseur",["Biere","Whisky","Cafe","Tabac"]]};
	case "Poissonnerie" : {["Poissonnerie",["Saupe","Girelle","Maquereau","Thon","Mulet","Roussette","Sel"]]};
	case "Metallurgie" : {["Metallurgie",["Aluminium","Cuivre","Fer","Acier"]]};
	case "Lux" : {["Export de luxe",["Argent","Pierres_Precieuses","Bijoux"]]};
	case "Construction" : {["Construction",["Bois","Chaux","Cuivre","Fer","Sable","Verre","Acier","Ciment"]]};
	case "Combustible" : {["Combustible",["Charbons","Bois","Petrole","Essence"]]};
	case "Dealer" : {["Dealer",["Cannabis","Coca","Opium","Cocaine","Heroine","Shit","Meth","Speed_Ball"]]};
	case "Pharmaceutique" : {["Pharmaceutique",["Pharmaceutique"]]};
	case "Contrebandier" : {["Contrebandier",["Tortue"]]};
	case "Boissons": {["Distributeur de boisson",["Bouteille_d_eau","Jus_Multifruit"]]};
	case "Frigo": {["Frigidaire a nourriture",["Wrap_Poulet","Big_Burger"]]};
};