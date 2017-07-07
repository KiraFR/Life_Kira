/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
if(playerSide == west || playerSide == civilian && {(call life_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
    ["life_inv_orange",life_inv_orange],
    ["life_inv_peche",life_inv_peche],
    ["life_inv_eau",life_inv_eau],
    ["life_inv_jus_multifruits",life_inv_jus_multifruits],
    ["life_inv_wrap",life_inv_wrap],
    ["life_inv_burger",life_inv_burger],
    ["life_inv_soda",life_inv_soda],
    ["life_inv_seau",life_inv_seau],
    ["life_inv_pelle",life_inv_pelle],
    ["life_inv_pioche",life_inv_pioche],
    ["life_resource_pommes",life_resource_pommes],
    ["life_resource_raisin",life_resource_raisin],
    ["life_resource_jus_pomme",life_resource_jus_pomme],
    ["life_resource_jus_raisin",life_resource_jus_raisin],
    ["life_resource_cidre",life_resource_cidre],
    ["life_resource_vin",life_resource_vin],
    ["life_resource_biere",life_resource_biere],
    ["life_resource_whisky",life_resource_whisky],
    ["life_resource_cafe",life_resource_cafe],
    ["life_resource_tabac",life_resource_tabac],
    ["life_resource_saupe",life_resource_saupe],
    ["life_resource_girelle",life_resource_girelle],
    ["life_resource_maquereau",life_resource_maquereau],
    ["life_resource_thon",life_resource_thon],
    ["life_resource_mulet",life_resource_mulet],
    ["life_resource_roussette",life_resource_roussette],
    ["life_resource_soupe_poisson",life_resource_soupe_poisson],
    ["life_resource_aluminium",life_resource_aluminium],
    ["life_resource_argent",life_resource_argent],
    ["life_resource_bois",life_resource_bois],
    ["life_resource_charbons",life_resource_charbons],
    ["life_resource_chaux",life_resource_chaux],
    ["life_resource_cuivre",life_resource_cuivre],
    ["life_resource_fer",life_resource_fer],
    ["life_resource_petrole",life_resource_petrole],
    ["life_resource_pierres_precieuses",life_resource_pierres_precieuses],
    ["life_resource_sable",life_resource_sable],
    ["life_resource_sel",life_resource_sel],
    ["life_resource_varre",life_resource_varre],
    ["life_resource_acier",life_resource_acier],
    ["life_resource_bijoux",life_resource_bijoux],
    ["life_resource_ciment",life_resource_ciment],
    ["life_resource_essence",life_resource_essence],
    ["life_resource_cannabis",life_resource_cannabis],
    ["life_resource_coca",life_resource_coca],
    ["life_resource_opium",life_resource_opium],
    ["life_resource_cocaine",life_resource_cocaine],
    ["life_resource_heroine",life_resource_heroine],
    ["life_resource_shit",life_resource_shit],
    ["life_resource_meth",life_resource_meth],
    ["life_resource_pharmceutique",life_resource_pharmceutique],
    ["life_resource_speedball",life_resource_speedball],
    ["life_resource_tortue",life_resource_tortue]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call life_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

life_gear = _return;
