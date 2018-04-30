--#aten_trigger
--zone:vexthal

--Spawns non-Destroy Aten if no boss mobs are up and global is not set.
--Spawns Destroy Aten if boss mobs are up and global is not set.

function event_spawn(e)
	eq.set_timer("aten",15 * 1000);   -- Check timer in 15 second intervals
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);
	local instance_id = eq.get_zone_instance_id();
	if(e.timer == "aten" and qglobals[instance_id .. "_aten"] == nil) then  --checks to see if qglobal was previously set
		 --checks to see if required Warders listed below are despawned
		 --                                            		Blob 1                                                            DXXT														  TVK                                						   DXVT/TXD 													VXAHR
		if (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(158418) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(158409) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(158405) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(158399)and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(158393)) then 
			eq.depop_all(158465);  --depop Destroy Aten version
			eq.unique_spawn(158436,0,0,1412,0,248.63,384); --spawns Real Aten (Non-Destroy Version)
		elseif (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(158465)) then  --check to see if Non-Destroy Aten has already been previously spawned
			eq.depop_all(158436); --depop Real Aten if still up
			eq.unique_spawn(158465,0,0,1412,0,248.63,384);  --spawns Destroy Aten version
		end
	end
end		







