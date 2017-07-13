/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "marche": {["Marché",["Orange","Peche","Pommes","Bouteille_d_eau","Jus_Multisfruits","Wrap_Poulet","Big_Burger","Soda_Extra_Energy_Drink"]]};
	case "flic": {["Marché Police",["Wrap_Poulet","Cafe","Herse","Bouteille_d_eau","Soda_Extra_Energy_Drink","Essence"]]};
	case "outillage": {["Outillage",["Seau","Pelle","Pioche"]]};
	case "Export_luxe": {["Export Luxe",["Argent","Pierres_Precieuses","Bijoux"]]};
	case "Export_Combustible": {["Export de Combustible ",["Bois","Charbon","fuelF","oil"]]};
	case "Export_Metalurgie": {["Export de Metallurgie ",["Fer","Cuivre","Aluminium","Acier"]]};
	case "Pommes" : {["Pommes",["Pommes"]]};
    case "Raisin" : {["Raisin",["Raisin"]]};
    case "Jus_de_pommes" : {["Jus_de_pommes",["Jus_de_pommes"]]};
    case "Jus_de_raisin" : {["Jus_de_raisin",["Jus_de_raisin"]]};
    case "Caviste" : {["Caviste",["Cidre","Vin"]]};
    case "Vin" : {["Vin",["Vin"]]};
    case "Biere" : {["Biere",["Biere"]]};
    case "Whisky" : {["Whisky",["Whisky"]]};
    case "Cafe" : {["Cafe",["Cafe"]]};
    case "Tabac" : {["Tabac",["Tabac"]]};
    case "Saupe" : {["Saupe",["Saupe"]]};
    case "Girelle" : {["Girelle",["Girelle"]]};
    case "Maquereau" : {["Maquereau",["Maquereau"]]};
    case "Thon" : {["Thon",["Thon"]]};
    case "Mulet" : {["Mulet",["Mulet"]]};
    case "Roussette" : {["Roussette",["Roussette"]]};
    case "Soupe_de_poisson" : {["Soupe_de_poisson",["Soupe_de_poisson"]]};
    case "Aluminium" : {["Aluminium",["Aluminium"]]};
    case "Argent" : {["Argent",["Argent"]]};
    case "Bois" : {["Bois",["Bois"]]};
    case "Charbons" : {["Charbons",["Charbons"]]};
    case "Chaux" : {["Chaux",["Chaux"]]};
    case "Cuivre" : {["Cuivre",["Cuivre"]]};
    case "Fer" : {["Fer",["Fer"]]};
    case "Petrole" : {["Petrole",["Petrole"]]};
    case "Pierres_Precieuses" : {["Pierres_Precieuses",["Pierres_Precieuses"]]};
    case "Sable" : {["Sable",["Sable"]]};
    case "Sel" : {["Sel",["Sel"]]};
    case "Verre" : {["Verre",["Verre"]]};
    case "Acier" : {["Acier",["Acier"]]};
    case "Bijoux" : {["Bijoux",["Bijoux"]]};
    case "Ciment" : {["Ciment",["Ciment"]]};
    case "Essence" : {["Essence",["Essence"]]};
    case "Canabis" : {["Canabis",["Canabis"]]};
    case "Coca" : {["Coca",["Coca"]]};
    case "Opium" : {["Opium",["Opium"]]};
    case "Cocaine" : {["Cocaine",["Cocaine"]]};
    case "Heroine" : {["Heroine",["Heroine"]]};
    case "Shit" : {["Shit",["Shit"]]};
    case "Meth" : {["Meth",["Meth"]]};
    case "Pharmaceutique" : {["Pharmaceutique",["Pharmaceutique"]]};
    case "Speed_Ball" : {["Speed_Ball",["Speed_Ball"]]};
    case "Tortue" : {["Tortue",["Tortue"]]};
    case "Construction" : {["Construction",["Bois","Fer","Cuivre","Sable","Verre","Acier","Ciment"]]};
    case "Poissonnerie" : {["Poissonnerie",["Saupe","Girelle","Maquereau","Thon","Mulet","Roussette"]]};
    case "Boisson": {["Distributeur de boisson",["Bouteille_d_eau","Jus_Multisfruits","Soda_Extra_Energy_Drink"]]};
		case "Frigo": {["Frigidaire a nourriture",["Wrap_Poulet","Big_Burger"]]};
};
