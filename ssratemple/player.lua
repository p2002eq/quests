--Controls respawn of Arch Lich Cycle on zone repop/crash since Idol is a triggered NPC

function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals["AL_Cycle"] == "R2" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162192) == false) then  --checks for Rhag`Zhezum death and verifies Rhag`Mozdezh is not already up
		eq.unique_spawn(162192, 0, 0, 644, -280, 146, 196); -- spawn Rhag`Mozdezh
		eq.spawn2(162193, 0, 0, 561, -235, 138, 128);  -- Rhag 2 guard
		eq.spawn2(162194, 0, 0, 660, -309, 146, 218);  -- Rhag 2 guard
		eq.spawn2(162195, 0, 0, 660, -246, 146, 165);  -- Rhag 2 guard
		eq.spawn2(162196, 0, 0, 561, -323, 138, 0);  	-- Rhag 2 guard
	elseif (qglobals["AL_Cycle"] == "AL" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162517) == false) then  --checks for Rhag`Mozdezh death and verifies Rhag`Mozdezh is not already up
		eq.unique_spawn(162517, 0, 0, 418, -141, 264, 0); --Spawns Arch Lich
		eq.spawn2(162518, 0, 0, 448, -161, 265, 224);  -- AL guard
		eq.spawn2(162519, 0, 0, 390, -161, 265, 32);  -- AL guard
		eq.spawn2(162090, 0, 0, 375, -64, 257, 64);  -- AL guard
		eq.spawn2(162090, 0, 0, 467, -64, 257, 192);  -- AL guard
	end
end