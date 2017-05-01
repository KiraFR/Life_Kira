private["_toArray"];

disableSerialization;
_display = findDisplay 14000;
_listBox = _display displayCtrl 14006;

_list = [
	["Salut ! :xD",0],
	["Helo ! ::)",1],
	["Ca va :;)",0],
	["oui :') et toi",1],
	["parfait alors",0],
	["Oui",1],
	["Bon :>) t'as un truc a me proposer ?",0],
	["hehe :B) je t'envoi sa demain !",1]
];



{
	_who = _x select 1;
	_msg = _x select 0;
	
	switch (_who) do {
		case 0 : {
			_msg = [_msg,"#FFFFFF","left"] call Kira_fnc_forEmoji;
			_msgTest = format["<t align='left' size='1.1' color='#FFFFFF'>%1</t><br />",_msg];
			diag_log _msgTest;
			life_listMessage = life_listMessage + _msgTest;
			_listBox ctrlSetStructuredText parseText life_listMessage;
		}; 
		case 1 : {
			_msg = [_msg,"#008B08","right"] call Kira_fnc_forEmoji;
			_msgTest = format["<t align='right' size='1.1' color='#008B08'>%1</t><br />",_msg];
			life_listMessage = life_listMessage + _msgTest;
			_listBox ctrlSetStructuredText parseText life_listMessage;
		};
	}; 
}foreach _list;