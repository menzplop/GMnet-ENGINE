/// Show_map_cont(map);
var temp_map=argument0;
if ds_exists(temp_map,ds_type_map)
{
    var key=ds_map_find_first(temp_map);
    for (i=0; i<ds_map_size(temp_map); i+=1)
    {
        show_debug_message(string(key));
        key=ds_map_find_next(temp_map,key);
    }
}