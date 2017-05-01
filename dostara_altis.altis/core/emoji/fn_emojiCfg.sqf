/*
	File: fn_emojiCfg.sqf
	Author: J. `Kira` D.
	
	Description:
	regroupe tout les emojis
*/
private["_path","_dir2","_dir3"];
params[["_tag",[],[[]]],["_color","",[""]],["_lor","",[""]]];
_emoji = format["%1%2%3",_tag select 0,_tag select 1,_tag select 2];

if(count _tag == 0) exitWith{};
_path = format["<img align='%1' image='icons\",_lor];
switch (_emoji) do { 
	case ":O)": { 
		_path = "</t>" + _path;
		_dir2 ="angels.paa'";
		_dir3 = format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];
	};//angels
	case "::@": { 
		_path = "</t>" + _path;
		_dir2 = "angry.paa'";
		_dir3 = format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];
	};//angry
	case ":;)": { _path= "</t>" + _path;_dir2 ="clinoeil.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//clinoeil
	case ":<3": { _path= "</t>" + _path;_dir2 ="coeur.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//coeur
	case ":/3": { _path= "</t>" + _path;_dir2 ="coeurbrise.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//coeurbrise
	case ":33": { _path= "</t>" + _path;_dir2 ="coeurcoeur.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//coeurcoeur
	case ":B)": { _path= "</t>" + _path;_dir2 ="cool.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//cool
	case "::/": { _path= "</t>" + _path;_dir2 ="decu.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//decu
	case ":>)": { _path= "</t>" + _path;_dir2 ="devils.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//devils
	case "::*": { _path= "</t>" + _path;_dir2 ="kiss.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//kiss
	case "::s": { _path= "</t>" + _path;_dir2 ="embarass.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//embarass
	case ":')": { _path= "</t>" + _path;_dir2 ="hehe.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//hehe
	case ":'(": { _path= "</t>" + _path;_dir2 ="larme.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//larme
	case ":xD": { _path= "</t>" + _path;_dir2 ="mdr.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//mdr
	case "::|": { _path= "</t>" + _path;_dir2 ="ok.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//ok
	case "::)": { _path= "</t>" + _path;_dir2 ="sourire.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//sourire
	case "::p": { _path= "</t>" + _path;_dir2 ="tirelangue.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//tirelangue
	case "::(": { _path= "</t>" + _path;_dir2 ="triste.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//triste
	case ":zZ": { _path= "</t>" + _path;_dir2 ="Zz.paa'";_dir3=format["/><t align='%2' size='1.1' color='%1'>",_color,_lor];};//Zz
	default{_path = _tag select 0;_dir2 = _tag select 1; _dir3 = _tag select 2;};
};
_array = [_path,_dir2,_dir3];
_array;