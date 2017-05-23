/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_con","_return"];
_con = param[0];
_return = switch(_con) do {
//      NAME                    MIN     MAX     SEIL    EVOL    VALUE   Ent     [ NAME coef ]
case "Oranges" : {[             1,      5,      3,      0.1,    0,      0,      [["Peches",0.1],["Pommes",0.1],["Raisin",0.1],["Jus_MultiFruit",0.2]]]};
case "Peches" : {[               1,      5,      3,      0.1,    0,      0,      [["Oranges",0.1],["Pommes",0.1],["Raisin",0.1],["Jus_MultiFruit",0.2]]]};
case "Pommes" : {[               1,      5,      3,      0.1,    0,      0,      [["Peches",0.1],["Oranges",0.1],["Raisin",0.1],["Jus_De_Pomme",0.4]]]};
case "Raisin" : {[              1,      5,      3,      0.1,    0,      0,      [["Peches",0.1],["Pommes",0.1],["Oranges",0.1],["Jus_De_Raisin",0.4]]]};

case "Jus_MultiFruit" : {[      1,      15,     10,     0.1,    0,      0,      [["Jus_De_Raisin",0.4],["Jus_De_Pomme",0.4]]]};
case "Jus_De_Pomme" : {[        1,      15,     10,     0.1,    0,      0,      [["Jus_MultiFruit",0.4],["Cidre",0.5],["Jus_De_Raisin",0.4]]]};
case "Jus_De_Raisin" : {[       1,      15,     10,     0.1,    0,      0,      [["Jus_MultiFruit",0.4],["Vin",0.5],["Jus_De_Pomme",0.4]]]};

case "Cidre" : {[               1,      25,     0,      0.2,    0,      0,      [["Vin",0.4],["Biers",0.3],["Wisky",0.3]]]};
case "Vin" : {[                 1,      25,     0,      0.2,    0,      0,      [["Cidre",0.4],["Biers",0.3],["Wisky",0.3]]]};

case "Biere" : {[               1,      0,      0,      0,      0,      0,      [["Cidre",0.2],["Wisky",0.4]]]};
case "Wisky" : {[               1,      0,      0,      0,      0,      0,      [["Vin",0.2],["Biers",0.4]]]};
case "Cafe" : {[                1,      0,      0,      0,      0,      0,      [["Tabac",0.5]]]};
case "Tabac" : {[               1,      0,      0,      0,      0,      0,      [["Cafe",0.5]]]};

case "Saupe" : {[               1,      23,     14,     0.5,    0,      0,      [["Girelle",0.1],["Maquereau",0.1],["Thon",0.1],["Mulet",0.1],["Roussette",0.1],["Soupe_De_Poisson",0.1],["Sel",0.2],["Tortue",0.2]]]};
case "Girelle" : {[             1,      19,     12,     0.5,    0,      0,      [["Saupe",0.1],["Maquereau",0.1],["Thon",0.1],["Mulet",0.1],["Roussette",0.1],["Soupe_De_Poisson",0.1],["Sel",0.2],["Tortue",0.2]]]};
case "Maquereau" : {[           1,      16,     9,      0.5,    0,      0,      [["Girelle",0.1],["Saupe",0.1],["Thon",0.1],["Mulet",0.1],["Roussette",0.1],["Soupe_De_Poisson",0.1],["Sel",0.2],["Tortue",0.2]]]};
case "Thon" : {[                1,      30,     21,     0.5,    0,      0,      [["Girelle",0.1],["Maquereau",0.1],["Saupe",0.1],["Mulet",0.1],["Roussette",0.1],["Soupe_De_Poisson",0.1],["Sel",0.2],["Tortue",0.2]]]};
case "Mulet" : {[               1,      18,     11,     0.5,    0,      0,      [["Girelle",0.1],["Maquereau",0.1],["Thon",0.1],["Saupe",0.1],["Roussette",0.1],["Soupe_De_Poisson",0.1],["Sel",0.2],["Tortue",0.2]]]};
case "Roussette" : {[           1,      32,     25,     0.5,    0,      0,      [["Girelle",0.1],["Maquereau",0.1],["Thon",0.1],["Mulet",0.1],["Saupe",0.1],["Soupe_De_Poisson",0.1],["Sel",0.2],["Tortue",0.2]]]};
case "Soupe_De_Poisson" : {[    1,      43,     15,     0.5,    0,      0,      [["Girelle",0.2],["Maquereau",0.2],["Thon",0.2],["Mulet",0.2],["Roussette",0.2],["Saupe",0.2],["Sel",0.2],["Tortue",0.2]]]};

case "Aluminium" : {[           1,      0,      33,     0.2,    0,      0,      [["Argent",0.1],["Charbon",0.2],["Cuivre",0.1],["Fer",0.2],["Acier",0.3]]]};
case "Argent" : {[              1,      0,      35,     0.2,    0,      0,      [["Aluminium",0.1],["Cuivre",0.1],["Fer",0.1],["Pierres_Precieuses",0.5],["Bijoux",0.3]]]};
case "Bois" : {[                1,      0,      18,     0.3,    0,      0,      [["Charbon",0.1],["Chaux",0.1],["Cuivre",0.1],["Fer",0.1],["Petrole",0.1],["Sable",0.1],["Verre",0.1],["Acier",0.1],["Ciment",0.1],["Essence",0.1]]]};
case "Charbon" : {[             1,      0,      22,     0.2,    0,      0,      [["Aluminium",0.2],["Bois",0.1],["Fer",0.2],["Petrole",0.1],["Acer",0.3],["Essence",0.1]]]};
case "Chaux" : {[               1,      0,      21,     0.2,    0,      0,      [["Bois",0.1],["Cuivre",0.1],["Fer",0.1],["Sable",0.2],["Verre",0.1],["Acier",0.1],["Ciment",0.3]]]};
case "Cuivre" : {[              1,      0,      24,     0.2,    0,      0,      [["Aluminium",0.1],["Argent",0.1],["Bois",0.1],["Chaux",0.1],["Fer",0.1],["Salbe",0.1],["Verre",0.1],["Acier",0.1],["Ciment",0.1]]]};
case "Fer" : {[                 1,      0,      27,     0.1,    0,      0,      [["Aluminium",0.2],["Argent",0.1],["Bois",0.1],["Charbon",0.2],["Chaux",0.1],["Cuivre",0.1],["Sable",0.1],["Verre",0.1],["Acier",0.3],["Ciment",0.1]]]};
case "Petrole" : {[             1,      0,      35,     0.2,    0,      0,      [["Bois",0.1],["Charbon",0.1],["Essence",0.1]]]};
case "Pierres_Precieuses" : {[  1,      0,      43,     0.1,    0,      0,      [["Argent",0.2],["Bijoux",0.3]]]};
case "Sable" : {[               1,      0,      17,     0.3,    0,      0,      [["Bois",0.1],["Cuivre",0.1],["Fer",0.1],["Verre",0.3],["Acier",0.1],["Ciment",0.1]]]};
case "Sel" : {[                 1,      0,      18,     0.3,    0,      0,      [["Girelle",0.2],["Maquereau",0.2],["Thon",0.2],["Mulet",0.2],["Roussette",0.2],["Saupe",0.2],["Soupe_De_Poisson",0.2],["Tortue",0.2]]]};
case "Verre" : {[               1,      0,      31,     0.3,    0,      0,      [["Bois",0.1],["Chaux",0.1],["Cuivre",0.1],["Fer",0.1],["Sable",0.3],["Acier",0.1],["Ciment",0.1]]]};

case "Acier" : {[               1,      0,      61,     0.1,    0,      0,      [["Aluminium",0.2],["Charbon",0.2],["Fer",0.2],["Ciment",0.1]]]};
case "Bijoux" : {[              1,      0,      70,     0.1,    0,      0,      [["Argent",0.2],["Pierres_Precieuses",0.1]]]};
case "Ciment" : {[              1,      0,      38,     0.1,    0,      0,      [["Chaux",0.2],["Sables",0.2],["Acier",0.2]]]};
case "Essence" : {[             1,      100,    42,     0.2,    0,      0,      [["Charbon",0.1],["Bois",0.1],["Petrole",0.3]]]};

case "Cannabis" : {[            1,      35,     29,     0.1,    0,      0,      [["Coca",0.1],["Opium",0.2],["Shit",0.3],["Cocaine",0.1],["Heroine",0.1],["Pharmaceutique",0.2],["Meth",0.1],["Tortue",0.1]]]};
case "Coca" : {[                1,      40,     33,     0.1,    0,      0,      [["Cannabis",0.1],["Opium",0.1],["Shit",0.1],["Cocaine",0.3],["Heroine",0.1],["Speedball",0.1]]]};
case "Opium" : {[               1,      40,     36,     0.1,    0,      0,      [["Coca",0.1],["Cannabis",0.2],["Shit",0.1],["Cocaine",0.1],["Heroine",0.3],["Pharmaceutique",0.2],["Meth",0.1],["Speedball",0.1]]]};
case "Cocaine" : {[             1,      0,      45,     0.2,    0,      0,      [["Coca",0.2],["Shit",0.1],["Cannabis",0.1],["Heroine",0.1],["Pharmaceutique",0.1],["Meth",0.1],["Speedball",0.3]]]};
case "Heroine" : {[             1,      0,      51,     0.2,    0,      0,      [["Opium",0.2],["Shit",0.1],["Cannabis",0.1],["Cocaine",0.1],["Pharmaceutique",0.1],["Meth",0.1],["Speedball",0.3]]]};
case "Shit" : {[                1,      0,      40,     0.2,    0,      0,      [["Cannabis",0.2],["Cocaine",0.1],["Heroine",0.1],["Pharmaceutique",0.1],["Meth",0.1],["Speedball",0.1],["Tortue",0.1]]]};

case "Meth" : {[                1,      0,      82,     0.1,    0,      0,      [["Verre",0.2],["Cannabis",0.1],["Opium",0.1],["Pharmaceutique",0.2],["Speedball",0.1]]]};
case "Pharmaceutique" : {[      1,      0,      57,     0.1,    0,      0,      [["Verre",0.2],["Cannabis",0.1],["Opium",0.1],["Meth",0.2],["Speedball",0.1]]]};
case "Speedball" : {[           1,      0,      76,     0.2,    0,      0,      [["Verre",0.2],["Cannabis",0.1],["Opium",0.1],["Meth",0.2],["Pharmaceutique",0.1]]]};

case "Tortue" : {[              1,      100,    54,     0.2,    0,      0,      [["Girelle",0.2],["Maquereau",0.2],["Thon",0.2],["Mulet",0.2],["Roussette",0.2],["Saupe",0.2],["Soupe_De_Poisson",0.2],["Sel",0.2]]]};

case "Name" : {["Oranges","Peches","Pommes","Raisin","Jus_MultiFruit","Jus_De_Pomme","Jus_De_Raisin","Cidre","Vin","Biere","Wisky","Cafe","Tabac","Saupe","Girelle","Maquereau","Thon","Mulet","Roussette","Soupe_De_Poisson","Aluminium","Argent" ,"Bois","Charbon","Chaux","Cuivre","Fer","Petrole","Pierres_Precieuses","Sable","Sel","Verre","Acier","Bijoux","Ciment","Essence","Cannabis","Coca","Opium","Cocaine","Heroine","Shit" ,"Meth","Pharmaceutique","Speedball","Tortue"]};

default {false};
};

_return;