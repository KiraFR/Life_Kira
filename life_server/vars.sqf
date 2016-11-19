/*
	@file Version: 1a
	@file name: vars.sqf
	@file Author: TAW_Tonic
	@file edit: 5/3/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/

//Calculate starting player base and times it by 1000 dollars to give initial bank funding.
_query = ["SELECT LAST(total) FROM gouv",2] call DB_fnc_asyncCall;
life_federal_funds = _query * 1/3;

life_animals_spawned = false;
life_animals_array = [];