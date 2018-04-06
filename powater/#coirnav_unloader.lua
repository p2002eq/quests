--#coirnav_unloader (216276)

function event_signal(e)
	if e.signal == 1 then
		eq.unload_encounter("Coirnav_Event");
	end
end	
