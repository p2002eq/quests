--#fennin_unloader (217066)
--Handles zone crash loading/unloading for Fennin Ro Encounter
--pofire


function event_spawn(e)	
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	
	--zone crash handling
	if (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(217050)) and (qglobals[instance_id .. "_PoFire_FenninEvent"] ~= nil) and 
		(qglobals[instance_id .. "_PoFire_FenninEvent"] ~= "Win") and (qglobals[instance_id .. "_PoFire_FenninEvent"] ~= "Failed") then
		eq.unload_encounter("Fennin_Event");
		eq.spawn_condition("pofire",eq.get_zone_instance_id(),1,0);	--reset spawn condition
		eq.set_timer("load",2000);
	end
end

function event_timer(e)
	if (e.timer == "load") then
		eq.stop_timer(e.timer);
		eq.load_encounter("Fennin_Event");
	end
end

function event_signal(e)
	if (e.signal == 1) then
		eq.unload_encounter("Fennin_Event");
	end
end	
