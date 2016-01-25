///htme_shutdown();

/*
**  Description:
**      PRIVATE "METHOD" OF obj_htme! That means this script MUST be called with obj_htme!
**
**      Shuts down GMnet CORE with no explanation or cleaning.
**      
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

self.started = false;
var wasServer=self.isServer;
self.isServer = false;
self.isConnected = false;
self.clientStopped = true;
var key;
// DESTROY ALL INSTANCES
key = ds_map_find_first(self.localInstances);
for(var i=0; i<ds_map_size(self.localInstances); i+=1) {
    var inst_id = ds_map_find_value(self.localInstances,key);
    if (instance_exists(inst_id)) {
        htme_cleanUpInstance(inst_id);
        if wasServer 
            htme_serverRemoveBackup(key);
        with inst_id {instance_destroy();}
    }
    key = ds_map_find_next(self.localInstances, key);
}
key = ds_map_find_first(self.globalInstances);
for(var i=0; i<ds_map_size(self.globalInstances); i+=1) {
    var inst_id = ds_map_find_value(self.globalInstances,key);
    if (instance_exists(inst_id)) {
        htme_cleanUpInstance(inst_id);
        if wasServer
            htme_serverRemoveBackup(key);        
        with inst_id {instance_destroy();}
    }
    key = ds_map_find_next(global.htme_object.globalInstances, key);
}
//CLEAN ALL DATA
ds_map_clear(self.localInstances);
ds_map_clear(self.globalInstances);
self.udphp_client_id = 0;
network_destroy(self.socketOrServer);
self.socketOrServer = -1;
self.server_ip = "";
self.playerhash = "";
self.server_port = 0;
if (ds_exists(self.udphp_playerlist, ds_type_map)) {ds_map_destroy(self.udphp_playerlist);show_map_destroy(self.udphp_playerlist,"htme_shutdown",59);}
if (ds_exists(self.playermap, ds_type_map)) {ds_map_destroy(self.playermap);show_map_destroy(self.udphp_playerlist,"htme_shutdown",60);}
if (ds_exists(self.kickmap, ds_type_map)) {ds_map_destroy(self.kickmap);show_map_destroy(self.kickmap,"htme_shutdown",61);}
if (ds_exists(self.playerrooms, ds_type_map)) {ds_map_destroy(self.playerrooms);show_map_destroy(self.playerrooms,"htme_shutdown",62);}
if (ds_exists(self.playerlist, ds_type_list)) {ds_list_destroy(self.playerlist);show_list_destroy(self.playerlist,"htme_shutdown",63);}
if (ds_exists(self.grouplist, ds_type_list)) {ds_list_destroy(self.grouplist);show_list_destroy(self.grouplist,"htme_shutdown",64);}
if (ds_exists(self.grouplist_local, ds_type_list)) {ds_list_destroy(self.grouplist_local);show_list_destroy(self.grouplist_local,"htme_shutdown",65);}
if (ds_exists(self.globalsync, ds_type_map)) {ds_map_destroy(self.globalsync);show_map_destroy(self.globalsync,"htme_shutdown",66);}
if (ds_exists(self.globalsync_datatypes, ds_type_map)) {ds_map_destroy(self.globalsync_datatypes);show_map_destroy(self.globalsync_datatypes,"htme_shutdown",67);}
if (ds_exists(self.serverTimeoutSend, ds_type_map)) {ds_map_destroy(self.serverTimeoutSend);show_map_destroy(self.serverTimeoutSend,"htme_shutdown",68);}
if (ds_exists(self.serverTimeoutRecv, ds_type_map)) {ds_map_destroy(self.serverTimeoutRecv);show_map_destroy(self.serverTimeoutRecv,"htme_shutdown",69);}
if (ds_exists(self.signedPacketsCategories, ds_type_map)) {ds_map_destroy(self.signedPacketsCategories);show_map_destroy(self.signedPacketsCategories,"htme_shutdown",70);}
if (ds_exists(self.serverBackup, ds_type_map)) {ds_map_destroy(self.serverBackup);show_map_destroy(self.serverBackup,"htme_shutdown",71);}
if (ds_exists(self.signedPackets, ds_type_list)) {ds_list_destroy(self.signedPackets);show_list_destroy(self.signedPackets,"htme_shutdown",72);}
htme_clean_signed_packets("");
ds_map_destroy(self.sPcountOUT);
show_map_destroy(self.sPcountOUT,"htme_shutdown",74);
self.sPcountOUT = ds_map_create();
show_map(self.sPcountOUT,"htme_shutdown",76);
ds_map_destroy(self.sPcountIN);
show_map_destroy(self.sPcountIN,"htme_shutdown",78);
self.sPcountIN = ds_map_create();
show_map(self.sPcountIN,"htme_shutdown",80);
if (ds_exists(self.chatQueues,ds_type_map)) {ds_map_destroy(self.chatQueues);show_map_destroy(self.chatQueues,"htme_shutdown",82);}
