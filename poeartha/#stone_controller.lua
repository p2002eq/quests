--stone_controller (218036)
--Controller for Stone Ring (Peregrin_Rockskull)
--poeartha

function event_spawn(e)
	started = false;
	eq.unload_encounter("Stone_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started and eq.get_entity_list():IsMobSpawnedByNpcTypeID(218029) then	--A_Rock_Monstrosity (218029)
			started = true;
			eq.load_encounter("Stone_Event");
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Stone_Event");
	end
end
