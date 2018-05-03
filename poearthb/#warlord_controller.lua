--#warlord_controller (222155)
--Controller for Warlord_Gintolaken Encounter
--poearthb

function event_spawn(e)
	started = false;
	eq.unload_encounter("Warlord_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started then	
			started = true;
			eq.load_encounter("Warlord_Event");
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Warlord_Event");
	end
end
