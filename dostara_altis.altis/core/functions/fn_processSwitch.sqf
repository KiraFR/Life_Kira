/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_con","_return"];
_con = param[0,"",[""]];
_return = switch(_con) do {
//  Case    Resource Name            Resource Name ,        Count   [[Required,Count],[R...,C...]...]
    case    "Jus_MultiFruit":       {["Jus_MultiFruit",     1,       [[["Orange",1],["peach",1]]]]};
    case    "Jus_De_apple":         {["Jus_De_apple",       1,      [[["apple",2]]]]};
    case    "Jus_De_Raisin":        {["Jus_De_Raisin",      1,      [[["Raisin",2]]]]};
    case    "Cidre":                {["Cidre",              1,      [[["Jus_De_apple",1],["glass",1]]]]};
    case    "Vin":                  {["Vin",                1,      [[["Jus_De_Raisin",1],["glass",1]]]]};
    case    "Fishsoup":             {["Fishsoup",           [2,3,4],[[
                                                                        [
                                                                            ["salema",1],["mackerel",1],["salt_r",1]]
                                                                        ],
                                                                        [
                                                                            [["tuna",1],["salt_r",2]],
                                                                            [["catshark",1],["salt_r",2]]
                                                                        ],
                                                                        [
                                                                           [["turtle",1],["salt_r",3]]
                                                                        ]
                                                                    ]]};
    case    "turtle":               {["turtle",             1,      [[["turtleD",1]]]]};                                                                
    case    "Aluminium":            {["Aluminium",          1,      [[["AluminiumB",3]]]]};
    case    "Argent":               {["Argent",             1,      [[["ArgentB",3]]]]};
    case    "Chaux":                {["Chaux",              1,      [[["Calcaire",2]]]]};
    case    "copper_r":             {["copper_r",           1,      [[["copperB",3]]]]};
    case    "iron_r":               {["iron_r",             1,      [[["FerB",4]]]]};
    case    "rock":                 {["rock",               1,      [[["rockB",3]]]]};
    case    "Acier":                {["Acier",              1,      [[["Aluminium",1],["Charbon",1],["iron_r",1]]]]};
    case    "bijoux":               {["bijoux",             1,      [[["Argent",1],["rock",1]]]]};
    case    "cement":               {["cement",             1,      [[["Chaux",1],["sand",1]]]]};
    case    "fuelF":                {["fuelF",              1,      [[["oil",1]]]]};
    case    "glass":                {["glass",              1,      [[["sand",2]]]]};

    case    "Pharmaceutique":       {["Pharmaceutique",     1,      [[["glass",1],["cannabis",1],["opium",1]]]]};
    case    "Meth":                 {["Meth",               1,      [[["Pharmaceutique",1],["glass",1]]]]};
    case    "Shit":                 {["Shit",               1,      [[["cannabis",1]]]]};
    case    "cocaine":              {["cocaine",            1,      [[["coca",2]]]]};
    case    "heroine":              {["heroine",            1,      [[["opium",2]]]]};
    case    "Speedball":            {["Speedball",          1,      [[["heroine",1],["cocaine",1]]]]};

    default {[]};
};
_return;