--#isle_one_controller (215424)
--Chamberlain Escalardian Event
--poair

function event_spawn(e)
	started = false;
	eq.unload_encounter("Chamberlain_Event");
end

function event_signal(e)
	if e.signal == 1 and not started then	--signal on death of Castellan of Air
		started = true;
		eq.load_encounter("Chamberlain_Event");
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Chamberlain_Event");
	end
end