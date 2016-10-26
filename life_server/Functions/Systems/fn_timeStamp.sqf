/*
	File: fn_timeStamp.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets a local timestamp on the vehicle to keep track of its initial creation.
*/
private["_vehicle","_timestamp"];
params[["_vehicle",Objnull,[Objnull]]];
if(isNull _vehicle) exitWith {};
_timestamp = parseNumber("Arma2Net.Unmanaged" callExtension "DateTime ['now', 'HHmmss']");

_vehicle setVariable["creation",_timestamp,false];