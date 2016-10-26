private["_id","_ret"];
params[
	"_id",
	"_ret"
];
_id = owner _id;
_ret = owner _ret;

[[_id],"life_fnc_adminid",_ret,false] spawn life_fnc_MP;