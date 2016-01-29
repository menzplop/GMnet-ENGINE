/// show_debug_info_hmte_object_step();
CheckType="maps_lists";
//CheckType="priority_queue";
if mouse_check_button_pressed(mb_left)
{
    var countlist=0;
    var countmap=0;
    var countpriority=0;
    var countqueue=0;    
    switch (CheckType)
    {
        case "maps_lists":
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
        break;
        case "priority_queue":
            show_debug_message("===========PRIORITY=AND=QUEUE=============");
            for (var i=0; i<5000; i+=1)
            {
                
                if ds_exists(i,ds_type_priority) then
                {
                    //show_debug_message(json_encode(i));
                    show_debug_message("Priority: " + string(i));
                    countpriority+=1;       
                }    
                if ds_exists(i,ds_type_queue) then
                {
                    //show_debug_message(json_encode(i));   
                    show_debug_message("Queue: " + string(i));
                    countqueue+=1;
                }
            };
            show_debug_message("==========================================");
            show_debug_message("Current priority count: " + string(countpriority) + " current queue count: " + string(countqueue));
            show_debug_message("==========================================");          
        break;        
    }
}
