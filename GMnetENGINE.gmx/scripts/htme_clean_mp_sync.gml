/// htme_clean_mp_sync();
/*
**  Description:
**      PRIVATE "METHOD" OF obj_htme! That means this script MUST be called with obj_htme!
**
**      Clean private ds maps from synced instances
**
**  Usage:
**      <See above>
**
**  Arguments:
**      <none>
**
**  Returns:
**      <nothing>
**
*/

ds_map_destroy(self.htme_mp_vars_recv);  
show_map_destroy(self.htme_mp_vars_recv,"htme_clean_mp_sync",19);   
ds_map_destroy(self.htme_mp_vars_sync);
show_map_destroy(self.htme_mp_vars_sync,"htme_clean_mp_sync",21);
ds_map_destroy(self.htme_mp_vars);
show_map_destroy(self.htme_mp_vars,"htme_clean_mp_sync",23);
