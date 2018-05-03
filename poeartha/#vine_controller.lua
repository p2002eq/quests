--#vine_controller (218342)
--Controller for Vine Ring (Derugoak_Bloodwalker)
--poeartha

function event_spawn(e)
	started = false;
	eq.unload_encounter("Vine_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started and eq.get_entity_list():IsMobSpawnedByNpcTypeID(218019) then	--A_Tainted_Rock_Beast (218019)
			started = true;
			eq.load_encounter("Vine_Event");
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Vine_Event");
	end
end
