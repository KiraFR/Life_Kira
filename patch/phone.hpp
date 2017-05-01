

class RscText_1000: RscText
{
	idc = 1000;
	text = "Message"; 
	x = 0;
	y = 0.38;
	w = 1;
	h = 0.04;
	colorBackground[] = {-1,-1,-1,0.7};
};
class RscText_1001: RscText
{
	idc = 1001;
	x = 0;
	y = 0.42;
	w = 0.425;
	h = 0.58;
	colorBackground[] = {-1,-1,-1,0.8};
};
class RscText_1002: RscText
{
	idc = 1002;
	x = 0.425;
	y = 0.42;
	w = 0.575;
	h = 0.58;
	colorBackground[] = {-1,-1,-1,0.8};
};
class list_convers: RscListbox
{
	idc = 1500;
	x = 0.025;
	y = 0.5;
	w = 0.375;
	h = 0.46;
};
class RscText_1003: RscText
{
	idc = 1003;
	text = "Conversation"; 
	x = 0.14625;
	y = 0.44;
	w = 0.125;
	h = 0.04;
};
class msg: RscListbox
{
	idc = 1501;
	x = 0.425;
	y = 0.5;
	w = 0.575;
	h = 0.42;
	colorText[] = {0,0,0,1};
	colorBackground[] = {1,1,1,1};
};
class DoMsg: RscEdit
{
	idc = 1400;
	text = "Ecrivez votre message"; 
	x = 0.425;
	y = 0.92;
	w = 0.475;
	h = 0.08;
	colorBackground[] = {1,1,1,1};
};
class SendButton: RscButtonMenu
{
	idc = 2400;
	x = 0.9;
	y = 0.92;
	w = 0.1;
	h = 0.08;
	colorBackground[] = {1,1,1,1};
};
class new_convers: RscButtonMenu
{
	idc = 2401;
	x = 0.35;
	y = 0.44;
	w = 0.025;
	h = 0.04;
};
class nom_contact: RscListbox
{
	idc = 1502;
	x = 0.6;
	y = 0.44;
	w = 0.25;
	h = 0.04;
};
class deleteconvers: RscButtonMenu
{
	idc = 2402;
	x = 0.05;
	y = 0.44;
	w = 0.025;
	h = 0.04;
};

