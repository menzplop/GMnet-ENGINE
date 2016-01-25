/// show_map_destroy(map index, script, line);
if !is_undefined(argument0)
{
    show_debug_message("Map: " + string(argument0) + " destroyed in " + string(argument1) + " line " + string(argument2));
}