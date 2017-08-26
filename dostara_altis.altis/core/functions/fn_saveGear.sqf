/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_sItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_sMag","_uni","_ves","_bag","_handled"];
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
_return pushBack primaryWeapon player;
_return pushBack handgunWeapon player;

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_sItems = [];
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

if(count (secondaryWeaponMagazine player) > 0 && alive player) then
{
    _sMag = ((secondaryWeaponMagazine player) select 0);
    if(_sMag != "") then
    {
        _uni = player canAddItemToUniform _sMag;
        _ves = player canAddItemToVest _sMag;
        _bag = player canAddItemToBackpack _sMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_sMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_sMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_sMag];
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

if(count (secondaryWeaponItems player) > 0) then
{
    {
        _sItems = _sItems + [_x];
    } forEach (secondaryWeaponItems player);
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
    ["life_inv_Jus_Multifruit",life_inv_Jus_Multifruit],
    ["life_inv_wrap",life_inv_wrap],
    ["life_inv_burger",life_inv_burger],
    ["life_inv_soda",life_inv_soda],
    ["life_inv_seau",life_inv_seau],
    ["life_inv_pelle",life_inv_pelle],
    ["life_inv_pioche",life_inv_pioche],
    ["life_ressource_pommes",life_ressource_pommes],
    ["life_ressource_raisin",life_ressource_raisin],
    ["life_ressource_jus_pomme",life_ressource_jus_pomme],
    ["life_ressource_jus_raisin",life_ressource_jus_raisin],
    ["life_ressource_cidre",life_ressource_cidre],
    ["life_ressource_vin",life_ressource_vin],
    ["life_ressource_biere",life_ressource_biere],
    ["life_ressource_whisky",life_ressource_whisky],
    ["life_ressource_cafe",life_ressource_cafe],
    ["life_ressource_tabac",life_ressource_tabac],
    ["life_ressource_saupe",life_ressource_saupe],
    ["life_ressource_girelle",life_ressource_girelle],
    ["life_ressource_maquereau",life_ressource_maquereau],
    ["life_ressource_thon",life_ressource_thon],
    ["life_ressource_mulet",life_ressource_mulet],
    ["life_ressource_roussette",life_ressource_roussette],
    ["life_ressource_soupe_poisson",life_ressource_soupe_poisson],
    ["life_ressource_aluminium",life_ressource_aluminium],
    ["life_ressource_argent",life_ressource_argent],
    ["life_ressource_bois",life_ressource_bois],
    ["life_ressource_charbons",life_ressource_charbons],
    ["life_ressource_chaux",life_ressource_chaux],
    ["life_ressource_cuivre",life_ressource_cuivre],
    ["life_ressource_fer",life_ressource_fer],
    ["life_ressource_petrole",life_ressource_petrole],
    ["life_ressource_pierres_precieuses",life_ressource_pierres_precieuses],
    ["life_ressource_sable",life_ressource_sable],
    ["life_ressource_sel",life_ressource_sel],
    ["life_ressource_verre",life_ressource_verre],
    ["life_ressource_acier",life_ressource_acier],
    ["life_ressource_bijoux",life_ressource_bijoux],
    ["life_ressource_ciment",life_ressource_ciment],
    ["life_ressource_essence",life_ressource_essence],
    ["life_ressource_cannabis",life_ressource_cannabis],
    ["life_ressource_coca",life_ressource_coca],
    ["life_ressource_opium",life_ressource_opium],
    ["life_ressource_cocaine",life_ressource_cocaine],
    ["life_ressource_heroine",life_ressource_heroine],
    ["life_ressource_shit",life_ressource_shit],
    ["life_ressource_meth",life_ressource_meth],
    ["life_ressource_pharmceutique",life_ressource_pharmceutique],
    ["life_ressource_speedball",life_ressource_speedball],
    ["life_ressource_tortue",life_ressource_tortue],
    ["life_inv_harpon",life_inv_harpon],
    ["life_inv_filet_a",life_inv_filet_a],
    ["life_inv_filet_p",life_inv_filet_p],
    ["life_inv_filet_e",life_inv_filet_e]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
_return pushBack _yItems;
_return pushBack _sItems;
_return pushBack secondaryWeapon player;


life_gear = _return;