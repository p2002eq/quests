--There's a gate in the Neriak Commons that is actually three separate doors, but the gates should all lift together as one. This CLICKDOOR script accomplishes that.

function event_click_door(e)
	if(e.door:GetDoorID() == 1) then
		eq.get_entity_list():FindDoor(2):ForceOpen(e.self);
		eq.get_entity_list():FindDoor(49):ForceOpen(e.self);
	elseif(e.door:GetDoorID() == 2) then
		eq.get_entity_list():FindDoor(1):ForceOpen(e.self);
		eq.get_entity_list():FindDoor(49):ForceOpen(e.self);
	elseif(e.door:GetDoorID() == 49) then
		eq.get_entity_list():FindDoor(1):ForceOpen(e.self);
		eq.get_entity_list():FindDoor(2):ForceOpen(e.self);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------