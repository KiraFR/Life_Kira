#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(__GETC__(life_coplevel) == 1) then
		{
			_ret pushBack ["Kronos_Police_01",nil,350];
		};
		if(__GETC__(life_coplevel) == 2) then
		{
			_ret pushBack ["Kronos_Police_02",nil,350];
		};
		if(__GETC__(life_coplevel) == 3) then
		{
			_ret pushBack ["Kronos_Police_03",nil,350];
		};
		if(__GETC__(life_coplevel) == 4) then
		{
			_ret pushBack ["Kronos_Police_04",nil,350];
		};
		if(__GETC__(life_coplevel) == 5) then
		{
			_ret pushBack ["Kronos_Police_05",nil,550];
		};
		if(__GETC__(life_coplevel) == 6) then
		{
			_ret pushBack ["Kronos_Police_06",nil,550];
		};
		if(__GETC__(life_coplevel) == 7) then
		{
			_ret pushBack ["Kronos_Police_07",nil,550];
		};
		if(__GETC__(life_coplevel) == 8) then
		{
			_ret pushBack ["Kronos_Police_08",nil,550];
		};
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret pushBack ["KronosD_Police_cap_01",nil,75];
		};
		if(__GETC__(life_coplevel) == 3) then
		{
			_ret pushBack ["H_Beret_blk",nil,100];
		};
		if(__GETC__(life_coplevel) == 6) then
		{
			_ret pushBack ["H_Beret_02",nil,100];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret pushBack ["H_Beret_Colonel",nil,100];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["KronosD_POLICE_vest_01",nil,1500];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_ret pushBack ["KronosD_POLICE_vest_02",nil,1500];
		};

	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500]
		];
	};
};

_ret;