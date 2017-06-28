/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_con","_return"];
_con = param[0,"",[""]];
_return = switch(_con) do {
//  Case    Resource Name            Resource Name ,        Count   [[Required,Count],[R...,C...]...]
    case    'Jus Multifruits':      {['Jus Multifruits',    1,      [[['Orange',1],['Peche',1]]]]};
    case    'Jus de Pomme':         {['Jus de Pomme',       1,      [[['Pomme',2]]]]};
    case    'Jus de Raisin':        {['Jus de Raisin',      1,      [[['Raisin',2]]]]};

    case    'Cidre':                {['Cidre',              1,      [[['Jus de Pomme',1],['Verre',1]]]]};
    case    'Vin':                  {['Vin',                1,      [[['Jus de Raisin',1],['Verre',1]]]]};

    case    'Soupe de Poisson':     {['Soupe de Poisson',   1,      [[['Saupe',1],['Maquereau',1],['Sel',1]],[['Thon',1],['Sel',2]],[['Roussette',1],['Sel',2]],[['Tortue',1],['Sel',3]]]]};

    case    'Acier':                {['Acier',              1,      [[['Aluminium',1],['Charbon',1],['Fer',1]]]]};
    case    'Bijoux':               {['Bijoux',             1,      [[['Argent',1],['Pierres Précieuses',1]]]]};
    case    'Ciment':               {['Ciment',             1,      [[['Chaux',1],['Sable',1]]]]};
    case    'Essence':              {['Essence',            1,      [[['Petrole',1]]]]};
    case    'Verre':                {['Verre',              1,      [[['Sable',1]]]]};

    case    'Pharmaceutique':       {['Pharmaceutique',     1,      [[['Verre',1],['Cannabis',1],['Opium',1]]]]};
    case    'Meth':                 {['Meth',               1,      [[['Pharmaceutique',1],['Verre',1]]]]};
    case    'Shit':                 {['Shit',               1,      [[['Cannabis',1]]]]};
    case    'Cocaine':              {['Cocaine',            1,      [[['Coca',2]]]]};
    case    'Heroine':              {['Heroine',            1,      [[['Opium',2]]]]};
    case    'Speedball':            {['Speedball',          1,      [[['heroine',1],['cocaine',1]]]]};

    default {[]};
};
_return;