--#dust_controller (218393)
--Controller for Dust Ring (A_Perfected_Warder_of_Earth)
--poeartha

function event_spawn(e)
	started = false;
	eq.unload_encounter("Dust_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started then	
			started = true;
			eq.load_encounter("Dust_Event");
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Dust_Event");
	end
end
