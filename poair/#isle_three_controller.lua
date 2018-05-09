--#isle_three_controller (215426)
--Controller for Elemental Masterpiece Event
--poair

function event_spawn(e)
	started = false;
	eq.unload_encounter("Masterpiece_Event");
end

function event_signal(e)
	if e.signal == 1 and not started then	
		started = true;
		eq.load_encounter("Masterpiece_Event");
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Masterpiece_Event");
	end
end
