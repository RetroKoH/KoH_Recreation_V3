/// @description Framework setup

// If not in initialisation room, load core handlers
// Change made based on Orbinaut. Instead of using persistent objects and calling
// reset scripts at each screen change, we can reset the objects in this manner.
if (room != rm_Template)
{
	instance_create(x, y, core_Background);
	instance_create(x, y, core_Palette);		
	instance_create(x, y, core_Renderer);
	instance_create(x, y, core_Camera);
	instance_create(x, y, core_Audio);
	instance_create(x, y, core_Input);
}
