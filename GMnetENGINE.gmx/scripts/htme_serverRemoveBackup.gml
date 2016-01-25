///htme_serverRemoveBackup(hash);

/*
**  Description:
**      Removes the backup of this instance. Make sure the instance is removed
**      from the engine!
**  
**  Usage:
**      <See above>
**
**  Arguments:
**      hash    string      hash identifier of the instance
**
**  Returns:
**      <none>
**
*/

var instancehash = argument0;
var backupEntry = ds_map_find_value(self.serverBackup,instancehash);
if (!is_undefined(backupEntry)) {

    //Clean up groups -> {entry} -> variables and remove from list
     // "groups" map may allready be destroyed before in htme_cleanUpInstance (if player was in same room as server when removed)
     if ds_exists(backupEntry[? "groups"],ds_type_map)
     {
         var key= ds_map_find_first(backupEntry[? "groups"]);
         for(var i=0; i<ds_map_size(backupEntry[? "groups"]); i+=1) {
             var group = ds_map_find_value(backupEntry[? "groups"],key);
             if is_undefined(group) group=-1;
             if (ds_exists(group,ds_type_map)) {
                 var var_list = ds_map_find_value(group,"variables");
                 if is_undefined(var_list) var_list=-1;
                 if ds_exists(var_list,ds_type_list) then {ds_list_destroy(var_list);show_list_destroy(var_list,"htme_serverRemoveBackup",34);}         
                 var list_ind = ds_list_find_index(self.grouplist,group);
                 if (list_ind != -1)
                    ds_list_delete(self.grouplist,list_ind);        
                 ds_map_destroy(group);
                 show_map_destroy(group,"htme_serverRemoveBackup",38);
             }
             key = ds_map_find_next(backupEntry[? "groups"], key);
         }
         ds_map_destroy(backupEntry[? "groups"]);
         show_map_destroy(backupEntry[? "groups"],"htme_serverRemoveBackup",43);     
     }
   ds_map_destroy(backupEntry[? "backupVars"]);
   show_map_destroy(backupEntry[? "backupVars"],"htme_serverRemoveBackup",46);
   ds_map_destroy(backupEntry[? "syncVars"]);
   show_map_destroy(backupEntry[? "syncVars"],"htme_serverRemoveBackup",48);
   ds_map_destroy(backupEntry);
   show_map_destroy(backupEntry,"htme_serverRemoveBackup",50);
   ds_map_delete(self.serverBackup,instancehash);
}
