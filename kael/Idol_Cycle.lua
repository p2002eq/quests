--LUA to control Idol/AoW Cycle
function event_spawn(e)
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals["Idol"] == "1" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113629) == false) then  --checks for Statue death and verifies Idol is not already up
		eq.unique_spawn(113629,0,0,1292,1267,-35,254.5);  --Spawns Idol if above is true
	end
end