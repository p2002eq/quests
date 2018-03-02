--Controls respawn of Arch Lich Cycle on zone repop/crash since Idol is a triggered NPC

function event_spawn(e)
	-- Get Instance ID
	local instance_id = eq.get_zone_instance_id();
	-- Set QGlobal Lockout to Instance ID
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals[instance_id.. "_AL_Cycle_Rhag2"] == "UP" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162192) == false) then  --checks for Rhag`Zhezum death and verifies Rhag`Mozdezh is not already up
		eq.unique_spawn(162192, 0, 0, 644, -280, 146,392.0); -- spawn Rhag`Mozdezh
		eq.unique_spawn(162193, 0, 0, 561, -235, 138,256.0);  -- Rhag 2 guard
		eq.unique_spawn(162194, 0, 0, 660, -309, 146,436.0);  -- Rhag 2 guard
		eq.unique_spawn(162195, 0, 0, 660, -246, 146,330.0);  -- Rhag 2 guard
		eq.unique_spawn(162196,0.0, 0, 561, -323, 138, 0);  	-- Rhag 2 guard
	end
	if (qglobals[instance_id.. "_AL_Cycle_ArchLich"] == "UP" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162517) == false) then  --checks for Rhag`Mozdezh death and verifies Arch Lich is not already up
		eq.unique_spawn(162517,0.0, 0, 418, -141, 264, 0); --Spawns Arch Lich
		eq.unique_spawn(162518, 0, 0, 448, -161, 265,448.0);  -- AL guard
		eq.unique_spawn(162519, 0, 0, 390, -161, 265,64.0);  -- AL guard
		eq.spawn2(162090, 0, 0, 375, -64, 257,128.0);  -- AL guard
		eq.spawn2(162090, 0, 0, 467, -64, 257,384.0);  -- AL guard
	end
end
