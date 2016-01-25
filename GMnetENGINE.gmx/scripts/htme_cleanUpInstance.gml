///htme_cleanUpInstance(inst);

/*
**  Description:
**      Destroys maps and lists created by mp_sync.
**  
**  Usage:
**      <See above>
**
**  Arguments:
**      instance   instance     instance
**
**  Returns:
**      <none>
**
*/

var inst = argument0;

with inst {
     
     //Clean up groups -> {entry} -> variables and remove from list
     var key= ds_map_find_first(self.htme_mp_groups);
     for(var i=0; i<ds_map_size(self.htme_mp_groups); i+=1) {
         var group = ds_map_find_value(self.htme_mp_groups,key);
         var var_list = ds_map_find_value(group,"variables");
         if is_undefined(var_list) var_list=-1;
         if ds_exists(var_list,ds_type_list) then {ds_list_destroy(var_list);show_list_destroy(var_list,"htme_cleanUpInstance",27);}
         var list_ind = ds_list_find_index(global.htme_object.grouplist,group);
         if (list_ind != -1)
            ds_list_delete(global.htme_object.grouplist,list_ind);
         var list_ind2 = ds_list_find_index(global.htme_object.grouplist_local,group);
         if (list_ind2 != -1)
            ds_list_delete(global.htme_object.grouplist_local,list_ind2);
         ds_map_destroy(group);
         show_map_destroy(group,"htme_cleanUpInstance",35);
         key = ds_map_find_next(self.htme_mp_groups, key);
     }
     ds_map_destroy(self.htme_mp_vars_recv);   
     show_map_destroy(self.htme_mp_vars_recv,"htme_cleanUpInstance",39); 
     ds_map_destroy(self.htme_mp_groups);
     show_map_destroy(self.htme_mp_groups,"htme_cleanUpInstance",41); 
     ds_map_destroy(self.htme_mp_vars);
     show_map_destroy(self.htme_mp_vars,"htme_cleanUpInstance",43); 
     ds_map_destroy(self.htme_mp_vars_sync);
     show_map_destroy(self.htme_mp_vars_sync,"htme_cleanUpInstance",45); 
}
