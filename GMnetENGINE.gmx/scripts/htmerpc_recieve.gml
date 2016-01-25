///htmerpc_recieve(message)
/* Processes RPC calls*/
var message = htme_chatGetMessage(argument0);
var from = htme_chatGetSender(argument0);

var rpc_command = json_decode(message);

var rid = rpc_command[? "id"];
var rpc_argument_count = rpc_command[? "argument_count"];
var result;

if (rpc_argument_count == 0) {
    result = script_execute(asset_get_index(rpc_command[? "script"]));
}

if (rpc_argument_count == 1) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"]);
}

if (rpc_argument_count == 2) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"]);
}

if (rpc_argument_count == 3) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"]);
}

if (rpc_argument_count == 4) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"]);
}

if (rpc_argument_count == 5) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"]);
}

if (rpc_argument_count == 6) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"]);
}

if (rpc_argument_count == 7) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"],rpc_command[? "argument6"]);
}

if (rpc_argument_count == 8) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"],rpc_command[? "argument6"],rpc_command[? "argument7"]);
}

if (rpc_argument_count == 9) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"],rpc_command[? "argument6"],rpc_command[? "argument7"],rpc_command[? "argument8"]);
}

if (rpc_argument_count == 10) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"],rpc_command[? "argument6"],rpc_command[? "argument7"],rpc_command[? "argument8"],rpc_command[? "argument9"]);
}

if (rpc_argument_count == 11) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"],rpc_command[? "argument6"],rpc_command[? "argument7"],rpc_command[? "argument8"],rpc_command[? "argument9"],rpc_command[? "argument10"]);
}

if (rpc_argument_count == 12) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"],rpc_command[? "argument6"],rpc_command[? "argument7"],rpc_command[? "argument8"],rpc_command[? "argument9"],rpc_command[? "argument10"],rpc_command[? "argument11"]);
}

if (rpc_argument_count == 13) {
    result = script_execute(asset_get_index(rpc_command[? "script"]),rpc_command[? "argument0"],rpc_command[? "argument1"],rpc_command[? "argument2"],rpc_command[? "argument3"],rpc_command[? "argument4"],rpc_command[? "argument5"],rpc_command[? "argument6"],rpc_command[? "argument7"],rpc_command[? "argument8"],rpc_command[? "argument9"],rpc_command[? "argument10"],rpc_command[? "argument11"],rpc_command[? "argument12"]);
}

//Only send returned value if this RPC isn't already about a returned value (otherwise this would result in an endless loop)
if (rpc_command[? "script"] != "htmerpc_callback") 
{
    //Send returned value back via RPC
    //The id is not relevant for this because we don't track this RPC - we leave it empty.
    htmerpc_send("",htmerpc_callback,from,rid,result);
}

//Destroy the map, we don't need it
ds_map_destroy(rpc_command);