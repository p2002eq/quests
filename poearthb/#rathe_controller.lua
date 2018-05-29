--#rathe_controller (222156)
--Controller for Rathe Council Encounter
--poearthb

function event_spawn(e)
	started = false;
	eq.unload_encounter("Rathe_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started then	
			started = true;
			eq.load_encounter("Rathe_Event");
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Rathe_Event");
	end
end
