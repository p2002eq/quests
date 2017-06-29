--Controls respawn of Arch Lich Cycle on zone repop/crash since Idol is a triggered NPC

function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals["AL_Cycle"] == "R2" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162192) == false) then  --checks for Rhag`Zhezum death and verifies Rhag`Mozdezh is not already up
		eq.unique_spawn(162192, 0, 0, 644, -280, 146, 196); -- spawn Rhag`Mozdezh
	elseif (qglobals["AL_Cycle"] == "AL" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162517) == false) then  --checks for Rhag`Mozdezh death and verifies Rhag`Mozdezh is not already up
		eq.unique_spawn(162517, 0, 0, 418, -141, 264, 0); --Spawns Arch Lich
	end
end