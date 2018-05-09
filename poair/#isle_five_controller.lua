--#isle_five_controller (215428)
--Controller for Sigismond_Windwalker (Spider) event
--poair

function event_spawn(e)
	started = false;
	eq.unload_encounter("Sigismond_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started and eq.get_entity_list():IsMobSpawnedByNpcTypeID(215375) then	--confirms event not started and Sigismond is up
			started = true;
			eq.load_encounter("Sigismond_Event");
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Sigismond_Event");
	end
end
