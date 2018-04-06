--#isle_two_controller (215425)
--Controller for Stormrider event
--poair

function event_spawn(e)
	started = false;
	eq.unload_encounter("Stormrider_Event");
end

function event_signal(e)
	if e.signal == 1 and not started then	--signal on death of select stormriders on isle
		started = true;
		eq.load_encounter("Stormrider_Event");
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Stormrider_Event");
	end
end

