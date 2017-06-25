/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_con","_return"];
_con = param[0];
_return = switch(_con) do {
//      NAME                    MIN     MAX     SEIL    EVOL    VALUE   Ent     [ NAME coef ]
case "Orange" : {[              1,      5,      3,      0.1,    0,      0,      [["peach",0.1],["apple",0.1],["Raisin",0.1],["Jus_MultiFruit",0.2]]]};
case "peach" : {[               1,      5,      3,      0.1,    0,      0,      [["Orange",0.1],["apple",0.1],["Raisin",0.1],["Jus_MultiFruit",0.2]]]};
case "apple" : {[               1,      5,      3,      0.1,    0,      0,      [["peach",0.1],["Orange",0.1],["Raisin",0.1],["Jus_De_Pomme",0.4]]]};
case "Raisin" : {[              1,      5,      3,      0.1,    0,      0,      [["peach",0.1],["apple",0.1],["Orange",0.1],["Jus_De_Raisin",0.4]]]};

case "Jus_MultiFruit" : {[      1,      15,     10,     0.1,    0,      0,      [["Jus_De_Raisin",0.4],["Jus_De_Pomme",0.4]]]};
case "Jus_De_Pomme" : {[        1,      15,     10,     0.1,    0,      0,      [["Jus_MultiFruit",0.4],["Cidre",0.5],["Jus_De_Raisin",0.4]]]};
case "Jus_De_Raisin" : {[       1,      15,     10,     0.1,    0,      0,      [["Jus_MultiFruit",0.4],["Vin",0.5],["Jus_De_Pomme",0.4]]]};

case "Cidre" : {[               1,      25,     0,      0.2,    0,      0,      [["Vin",0.4],["Biers",0.3],["Wisky",0.3]]]};
case "Vin" : {[                 1,      25,     0,      0.2,    0,      0,      [["Cidre",0.4],["Biers",0.3],["Wisky",0.3]]]};

case "Biere" : {[               1,     -1,      0,      0,      0,      0,      [["Cidre",0.2],["Wisky",0.4]]]};
case "Wisky" : {[               1,     -1,      0,      0,      0,      0,      [["Vin",0.2],["Biers",0.4]]]};
case "coffee" : {[              1,     -1,      0,      0,      0,      0,      [["Tabac",0.5]]]};
case "Tabac" : {[               1,     -1,      0,      0,      0,      0,      [["coffee",0.5]]]};

case "salema" : {[              1,      23,     14,     0.5,    0,      0,      [["ornate",0.1],["mackerel",0.1],["tuna",0.1],["mullet",0.1],["catshark",0.1],["turtlesoup",0.1],["salt_r",0.2],["turtle",0.2]]]};
case "ornate" : {[              1,      19,     12,     0.5,    0,      0,      [["salema",0.1],["mackerel",0.1],["tuna",0.1],["mullet",0.1],["catshark",0.1],["turtlesoup",0.1],["salt_r",0.2],["turtle",0.2]]]};
case "mackerel" : {[            1,      16,     9,      0.5,    0,      0,      [["ornate",0.1],["salema",0.1],["tuna",0.1],["mullet",0.1],["catshark",0.1],["turtlesoup",0.1],["salt_r",0.2],["turtle",0.2]]]};
case "tuna" : {[                1,      30,     21,     0.5,    0,      0,      [["ornate",0.1],["mackerel",0.1],["salema",0.1],["mullet",0.1],["catshark",0.1],["turtlesoup",0.1],["salt_r",0.2],["turtle",0.2]]]};
case "mullet" : {[              1,      18,     11,     0.5,    0,      0,      [["ornate",0.1],["mackerel",0.1],["tuna",0.1],["salema",0.1],["catshark",0.1],["turtlesoup",0.1],["salt_r",0.2],["turtle",0.2]]]};
case "catshark" : {[            1,      32,     25,     0.5,    0,      0,      [["ornate",0.1],["mackerel",0.1],["tuna",0.1],["mullet",0.1],["salema",0.1],["turtlesoup",0.1],["salt_r",0.2],["turtle",0.2]]]};
case "turtlesoup" : {[          1,      43,     15,     0.5,    0,      0,      [["ornate",0.2],["mackerel",0.2],["tuna",0.2],["mullet",0.2],["catshark",0.2],["salema",0.2],["salt_r",0.2],["turtle",0.2]]]};

case "Aluminium" : {[           1,     -1,      33,     0.2,    0,      0,      [["Argent",0.1],["Charbon",0.2],["copper_r",0.1],["iron_r",0.2],["Acier",0.3]]]};
case "Argent" : {[              1,     -1,      35,     0.2,    0,      0,      [["Aluminium",0.1],["copper_r",0.1],["iron_r",0.1],["diamondc",0.5],["diamond",0.3]]]};
case "Bois" : {[                1,     -1,      18,     0.3,    0,      0,      [["Charbon",0.1],["Chaux",0.1],["copper_r",0.1],["iron_r",0.1],["oilp",0.1],["Sable",0.1],["glass",0.1],["Acier",0.1],["cement",0.1],["fuelF",0.1]]]};
case "Charbon" : {[             1,     -1,      22,     0.2,    0,      0,      [["Aluminium",0.2],["Bois",0.1],["iron_r",0.2],["oilp",0.1],["Acer",0.3],["fuelF",0.1]]]};
case "Chaux" : {[               1,     -1,      21,     0.2,    0,      0,      [["Bois",0.1],["copper_r",0.1],["iron_r",0.1],["Sable",0.2],["glass",0.1],["Acier",0.1],["cement",0.3]]]};
case "copper_r" : {[            1,     -1,      24,     0.2,    0,      0,      [["Aluminium",0.1],["Argent",0.1],["Bois",0.1],["Chaux",0.1],["iron_r",0.1],["Salbe",0.1],["glass",0.1],["Acier",0.1],["cement",0.1]]]};
case "iron_r" : {[              1,     -1,      27,     0.1,    0,      0,      [["Aluminium",0.2],["Argent",0.1],["Bois",0.1],["Charbon",0.2],["Chaux",0.1],["copper_r",0.1],["Sable",0.1],["glass",0.1],["Acier",0.3],["cement",0.1]]]};
case "oilp" : {[                1,     -1,      35,     0.2,    0,      0,      [["Bois",0.1],["Charbon",0.1],["fuelF",0.1]]]};
case "diamondc" : {[            1,     -1,      43,     0.1,    0,      0,      [["Argent",0.2],["diamond",0.3]]]};
case "Sable" : {[               1,     -1,      17,     0.3,    0,      0,      [["Bois",0.1],["copper_r",0.1],["iron_r",0.1],["glass",0.3],["Acier",0.1],["cement",0.1]]]};
case "salt_r" : {[              1,     -1,      18,     0.3,    0,      0,      [["ornate",0.2],["mackerel",0.2],["tuna",0.2],["mullet",0.2],["catshark",0.2],["salema",0.2],["turtlesoup",0.2],["turtle",0.2]]]};
case "glass" : {[               1,     -1,      31,     0.3,    0,      0,      [["Bois",0.1],["Chaux",0.1],["copper_r",0.1],["iron_r",0.1],["Sable",0.3],["Acier",0.1],["cement",0.1]]]};

case "Acier" : {[               1,     -1,      61,     0.1,    0,      0,      [["Aluminium",0.2],["Charbon",0.2],["iron_r",0.2],["cement",0.1]]]};
case "diamond" : {[             1,     -1,      70,     0.1,    0,      0,      [["Argent",0.2],["diamondc",0.1]]]};
case "cement" : {[              1,     -1,      38,     0.1,    0,      0,      [["Chaux",0.2],["Sables",0.2],["Acier",0.2]]]};
case "fuelF" : {[               1,      100,    42,     0.2,    0,      0,      [["Charbon",0.1],["Bois",0.1],["oilp",0.3]]]};

case "marijuana" : {[           1,      35,     29,     0.1,    0,      0,      [["cocainep",0.1],["opium",0.2],["Shit",0.3],["Cocaine",0.1],["heroinp",0.1],["Pharmaceutique",0.2],["Meth",0.1],["turtle",0.1]]]};
case "cocainep" : {[            1,      40,     33,     0.1,    0,      0,      [["marijuana",0.1],["opium",0.1],["Shit",0.1],["Cocaine",0.3],["heroinp",0.1],["Speedball",0.1]]]};
case "opium" : {[               1,      40,     36,     0.1,    0,      0,      [["cocainep",0.1],["marijuana",0.2],["Shit",0.1],["Cocaine",0.1],["heroinp",0.3],["Pharmaceutique",0.2],["Meth",0.1],["Speedball",0.1]]]};
case "Cocaine" : {[             1,     -1,      45,     0.2,    0,      0,      [["cocainep",0.2],["Shit",0.1],["marijuana",0.1],["heroinp",0.1],["Pharmaceutique",0.1],["Meth",0.1],["Speedball",0.3]]]};
case "heroinp" : {[             1,     -1,      51,     0.2,    0,      0,      [["opium",0.2],["Shit",0.1],["marijuana",0.1],["Cocaine",0.1],["Pharmaceutique",0.1],["Meth",0.1],["Speedball",0.3]]]};
case "Shit" : {[                1,     -1,      40,     0.2,    0,      0,      [["marijuana",0.2],["Cocaine",0.1],["heroinp",0.1],["Pharmaceutique",0.1],["Meth",0.1],["Speedball",0.1],["turtle",0.1]]]};

case "Meth" : {[                1,     -1,      82,     0.1,    0,      0,      [["glass",0.2],["marijuana",0.1],["opium",0.1],["Pharmaceutique",0.2],["Speedball",0.1]]]};
case "Pharmaceutique" : {[      1,     -1,      57,     0.1,    0,      0,      [["glass",0.2],["marijuana",0.1],["opium",0.1],["Meth",0.2],["Speedball",0.1]]]};
case "Speedball" : {[           1,     -1,      76,     0.2,    0,      0,      [["glass",0.2],["marijuana",0.1],["opium",0.1],["Meth",0.2],["Pharmaceutique",0.1]]]};

case "turtle" : {[              1,      100,    54,     0.2,    0,      0,      [["ornate",0.2],["mackerel",0.2],["tuna",0.2],["mullet",0.2],["catshark",0.2],["salema",0.2],["turtlesoup",0.2],["salt_r",0.2]]]};

case "Name" : {["Orange","peach","apple","Raisin","Jus_MultiFruit","Jus_De_Pomme","Jus_De_Raisin","Cidre","Vin","Biere","Wisky","coffee","Tabac","salema","ornate","mackerel","tuna","mullet","catshark","turtlesoup","Aluminium","Argent" ,"Bois","Charbon","Chaux","copper_r","iron_r","oilp","diamondc","Sable","salt_r","glass","Acier","diamond","cement","fuelF","marijuana","cocainep","opium","Cocaine","heroinp","Shit" ,"Meth","Pharmaceutique","Speedball","turtle"]};

default {false};
};

if (_return) then {
    _return;
};