private["_id","_ret"];
params[
	"_id",
	"_ret"
];
_id = owner _id;
_ret = owner _ret;

[_id] remoteExecCall ["life_fnc_adminid",_ret];