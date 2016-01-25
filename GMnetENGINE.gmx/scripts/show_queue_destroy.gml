/// show_queue_destroy(queue index, script, line);
if !is_undefined(argument0)
{
    show_debug_message("Queue: " + string(argument0) + " destroyed in " + string(argument1) + " line " + string(argument2));
}
