/// htme_clean_connect_leftovers();
/*
**  Description:
**      PRIVATE "METHOD" OF obj_htme! That means this script MUST be called with obj_htme!
**
**      Clean must have connect maps. When disconnect we must have these maps
**      But if we destroy/re-init the obj_htme we must destroy these maps
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

ds_map_destroy(self.localInstances);
show_map_destroy(self.localInstances,"htme_init",19);
ds_map_destroy(self.globalInstances);
show_map_destroy(self.globalInstances,"htme_init",21);
ds_map_destroy(self.sPcountOUT);
show_map_destroy(self.sPcountOUT,"htme_init",23);
ds_map_destroy(self.sPcountIN);
show_map_destroy(self.sPcountIN,"htme_init",25);
