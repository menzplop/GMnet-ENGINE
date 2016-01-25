/// show_debug_info_hmte_object_step();
if mouse_check_button_pressed(mb_left)
{
    var countlist=0;
    var countmap=0;
    show_debug_message("============LISTS=AND=MAPS================");
    for (var i=0; i<5000; i+=1)
    {
        if ds_exists(i,ds_type_list) then
        {
            //show_debug_message(json_encode(i));
            show_debug_message("List: " + string(i));
            countlist+=1;       
        }    
        if ds_exists(i,ds_type_map) then
        {
            //show_debug_message(json_encode(i));   
            // Check if async map that is still here
            if is_undefined(ds_map_find_value(i,"buffer"))
            {
                show_debug_message("Map: " + string(i));
            }
            else
            {
                show_debug_message("Map: " + string(i) + " (async_load map - will be auto removed soon)");
            }
            countmap+=1;     
        }
    };
    show_debug_message("==========================================");
    show_debug_message("Current list count: " + string(countlist) + " current map count: " + string(countmap));
    show_debug_message("==========================================");
}
