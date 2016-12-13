
class RscText_1000: RscText
{
	idc = 1000;
	text = "Message"; 
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0.7};
};
class RscText_1001: RscText
{
	idc = 1001;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0.8};
};
class RscText_1002: RscText
{
	idc = 1002;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 23 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0.8};
};
class list_convers: RscListbox
{
	idc = 1500;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 15 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
};
class RscText_1003: RscText
{
	idc = 1003;
	text = "Conversation"; 
	x = 5.85 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class msg: RscListbox
{
	idc = 1501;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 23 * GUI_GRID_W;
	h = 10.5 * GUI_GRID_H;
	colorText[] = {0,0,0,1};
	colorBackground[] = {1,1,1,1};
};
class DoMsg: RscEdit
{
	idc = 1400;
	text = "Ecrivez votre message"; 
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {1,1,1,1};
};
class SendButton: RscButtonMenu
{
	idc = 2400;
	x = 36 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {1,1,1,1};
};
class new_convers: RscButtonMenu
{
	idc = 2401;
	x = 14 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class nom_contact: RscListbox
{
	idc = 1502;
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class deleteconvers: RscButtonMenu
{
	idc = 2402;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 1 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
