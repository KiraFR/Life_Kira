/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_con","_return"];
_con = param[0,"",[""]];
_return = switch(_con) do {
//  Case    Traitement Name             Resource Name ,             Count       [[Required,Count],[R...,C...]...]
    case    "Jus_MultiFruit":           {["Jus_MultiFruit",         1,          [[["Jus_de_pommes",1],["Peche",1]]]]};
    case    "Jus_de_pommes":            {["Jus_de_pommes",          1,          [[["Pommes",2]]]]};
    case    "Jus_de_raisin":            {["Jus_de_raisin",          1,          [[["Raisin",2]]]]};
    case    "Cidre":                    {["Cidre",                  1,          [[["Jus_de_pommes",1],["Verre",1]]]]};
    case    "Vin":                      {["Vin",                    1,          [[["Jus_de_raisin",1],["Verre",1]]]]};

    case    "Soupe_de_poisson":         {["Soupe_de_poisson",       [2,3,4],    [[
                                                                                    [
                                                                                        ["Saupe",1],["Maquereau",1],["Sel",1]]
                                                                                    ],
                                                                                    [
                                                                                        [["Tortue",1],["Sel",2]],
                                                                                        [["Roussette",1],["Sel",2]]
                                                                                    ],
                                                                                    [
                                                                                        [["Tortue",1],["Sel",3]]
                                                                                    ]
                                                                                ]]};

    case    "Soupe_de_poisson_2":       {["Soupe_de_poisson",       1,          [[["Tortue",1]]]]};
    case    "Aluminium":                {["Aluminium",              1,          [[["Aluminium_Brut",3]]]]};
    case    "Argent":                   {["Argent",                 1,          [[["Argent_Brut",3]]]]};
    case    "Chaux":                    {["Chaux",                  1,          [[["Calcaire",2]]]]};
    case    "Cuivre":                   {["Cuivre",                 1,          [[["Cuivre_Brut",3]]]]};
    case    "Fer":                      {["Fer",                    1,          [[["Fer_Brut",4]]]]};
    case    "Bijoux":                   {["Bijoux",                 1,          [[["Pierres_Precieuses",3]]]]};
    case    "Acier":                    {["Acier",                  1,          [[["Aluminium",1],["Charbon",1],["Fer",1]]]]};
    case    "Bijoux_2":                 {["Bijoux",                 3,          [[["Argent",1],["Pierres_Precieuses",1]]]]};
    case    "Ciment":                   {["Ciment",                 1,          [[["Chaux",1],["Sable",1]]]]};
    case    "Essence":                  {["Essence",                1,          [[["Petrole",1]]]]};
    case    "Verre":                    {["Verre",                  1,          [[["Sable",2]]]]};

    case    "Pharmaceutique":           {["Pharmaceutique",         1,          [[["Verre",1],["Canabis",1],["Opium",1]]]]};
    case    "Meth":                     {["Meth",                   1,          [[["Pharmaceutique",1],["Verre",1]]]]};
    case    "Shit":                     {["Shit",                   1,          [[["Canabis",1]]]]};
    case    "Cocaine":                  {["Cocaine",                1,          [[["Cocaine",2]]]]};
    case    "Heroine":                  {["Heroine",                1,          [[["Opium",2]]]]};
    case    "Speed_Ball":               {["Speed_Ball",             1,          [[["Heroine",1],["Cocaine",1]]]]};

    default {[]};
};
_return;