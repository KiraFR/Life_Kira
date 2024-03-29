/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red";};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Black"};
			case 7: {_color = "Black"};
			case 8: {_color = "Taxi"};
		};
	};

	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Green";};
			case 2: {_color = "Blue";};
			case 3: {_color = "Dark Blue";};
			case 4: {_color = "Yellow";};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
		};
	};

	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "Cop"};
		};
	};

	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red";};
			case 1: {_color = "Black";};
			case 2: {_color = "Silver";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Cop";};
		};
	};

	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};

	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};

	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};

	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};

	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sheriff"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "EMS White"};
		};
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "EMS White"};
		};
	};

	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Regular"};
			case 1: {_color = "Black"};
		};
	};

	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};

	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};

	case "O_Heli_Transport_04_medevac_F":
	{
		switch (_index) do
		{
			case 0: {_color = "SIM"};
		};
	};

	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};

	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	case "ivory_gt500":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_rs4":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_m3":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_wrx":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_evox":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_c":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_e36":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_veyron":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_suburban":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_isf":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_elise":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_f1":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_mp4":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_190e":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_r34":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_supra":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};

	case "ivory_supra_topsecret":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_gti":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};
	case "ivory_lfa":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Aqua"};
			case 3: {_color = "Baby Bleu"};
			case 4: {_color = "Baby Rose"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Bourgogne"};
			case 7: {_color = "Cardinal"};
			case 8: {_color = "Vert foncé"};
			case 9: {_color = "Or"};
			case 10: {_color = "Vert"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Lavande"};
			case 13: {_color = "Bleu Ligth"};
			case 14: {_color = "Jaune Ligth"};
			case 15: {_color = "Citron Vert"};
			case 16: {_color = "Marina Bleu"};
			case 17: {_color = "Bleu Marine"};
			case 18: {_color = "Orange"};
			case 19: {_color = "Sable"};
			case 20: {_color = "Argent"};
			case 21: {_color = "Blanc"};
		};
	};

};

_color;
