/*
    File: fn_calculatePrice.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
private ["_price"];
_price = 150000;

if (playerSide == west)then {_price * 1.25 }else {_price};

if (licence_civ_gouv == 1)then {_price * 1.5}else {_price};