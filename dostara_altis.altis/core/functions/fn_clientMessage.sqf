params ["_msg","_from","_type"];

if(_from == "") exitWith {};

switch _type do
{
	case 0 :
	{
		private["_message"];
		_message = format[">>>MESSAGE FROM %1: %2",_from,_msg];
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>New Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];

		["TextMessage",[format["You Received A New Private Message From %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};

	case 1 :
	{
		if(side player != west) exitWith {};
		private["_message"];
		_message = format["---911 DISPATCH FROM %1: %2",_from,_msg];
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>New Dispatch<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Officers<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];

		["PoliceDispatch",[format["A New Police Report From: %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};

	case 2 :
	{
		if((call life_adminlevel) < 1) exitWith {};
		private["_message"];
		_message = format["???ADMIN REQUEST FROM %1: %2",_from,_msg];
		hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];

		["AdminDispatch",[format["%1 Has Requested An Admin!",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};

	case 3 :
	{
		private["_message"];
		_message = format["!!!ADMIN MESSAGE: %1",_msg];
		_admin = format["Sent by admin: %1", _from];
		hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>An Admin<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_msg];

		["AdminMessage",["You Have Received A Message From An Admin!"]] call bis_fnc_showNotification;
		systemChat _message;
		if((call life_adminlevel) > 0) then {systemChat _admin;};
	};

	case 4 :
	{
		private["_message","_admin"];
		_message = format["!!!ADMIN MESSAGE: %1",_msg];
		_admin = format["Sent by admin: %1", _from];
		hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Players<br/><t color='#33CC33'>From: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_msg];

		["AdminMessage",["You Have Received A Message From An Admin!"]] call bis_fnc_showNotification;
		systemChat _message;
		if((call life_adminlevel) > 0) then {systemChat _admin;};
	};

	case 5: {
		private["_message"];
		_message = format["!!!EMS REQUEST: %1",_msg];
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>EMS Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];

		["TextMessage",[format["EMS Request from %1",_from]]] call bis_fnc_showNotification;
	};
};
