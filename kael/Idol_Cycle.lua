--LUA to control Idol/AoW Cycle
function event_spawn(e)
	-- Get Instance ID
	local instance_id = eq.get_zone_instance_id();
	-- Load QGlobals and Check if Idol is allows up
	local qglobals = eq.get_qglobals(e.self);

	if ((qglobals[instance_id.."_idol"] == 1) and (eq.get_entity_list():IsMobSpawnedByNpcTypeID(113629) == false)) then
		eq.unique_spawn(113629,0,0,1292,1267,-35,254.5);  --Spawns Idol if above is true
	end
end