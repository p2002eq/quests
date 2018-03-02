--#aten_trigger
--zone:vexthal

--Spawns non-Destroy Aten if no boss mobs are up and global is not set.
--Spawns Destroy Aten if boss mobs are up and global is not set.

function event_spawn(e)
	eq.set_timer("aten",5*1000);   -- Check timer in 5 second intervals
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);
	local instance_id = eq.get_zone_instance_id();
	if(e.timer == "aten" and qglobals[instance_id .. "_aten"] == nil) then  --checks to see if qglobal was previously set
		 --checks to see if required Warders listed below are despawned
		 --                                              Blob 1                                                            DXXT																  TVK                                						      DXVT/TXD 															VXAHR
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(158418) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(158409) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(158405) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(158399) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(158393) == false) then 
			eq.depop_all(158465);  --depop Destroy Aten version
			eq.spawn2(158436,0,0,1412,0,248.63,384.0)
			eq.depop_with_timer();  --despawns trigger
		elseif (eq.get_entity_list():IsMobSpawnedByNpcTypeID(158465) == false) then  --check to see if Non-Destroy Aten has already been previously spawned
			eq.depop_all(158436); --depop Real Aten if still up
			eq.spawn2(158465,0,0,1412,0,248.63,384.0);  --spawns Destroy Aten version
		end
	end
end
			







