--Controls respawn of Emp Cycle on zone repop/crash since its a triggered NPC

function event_spawn(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals[instance_id .. "_Emp_Cycle"] == "1" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162504) == false) then  --checks for Blood Death death and verifies Emp is not already up
		eq.unique_spawn(162504,0,0,1000,-325,421,196);  -- Spawns Emp
	end
end