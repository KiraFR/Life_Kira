#define CONSTANT(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable
#define __GETC__(var) (call var) //Quick clean macro for getting a value of a constant / compileFinal variable. i.e if(__GETC__(numberone) == 1) then {}

#define CASH life_cash
#define BANK life_atmcash

//Control Macros
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
#define getSelValue(ctrl) (lbValue[##ctrl,(lbCurSel ##ctrl)])

//Player based quick macros
#define grpPlayer group player
#define steamid getPlayerUID player

#define RSERV 2 //Only server
#define RCLIENT -2 //Except server
#define RANY 0 //Global

#define life_num (player getVariable "phoneNumber")
#define life_numAcc (player getVariable "numeroAccount")
#define life_numforEach(var1) (var1 getVariable "phoneNumber")
#define life_numAccforEach(var1) (var1 getVariable "numeroAccount")
#define life_numModif(var1) (player setVariable ["phoneNumber",(var1),true])
#define hintFormat(var1,var2) hint format[var1,var2];
#define sysFormat(var1,var2) systemChat format[var1,var2];
