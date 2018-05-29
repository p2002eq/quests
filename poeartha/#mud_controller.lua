--#mud_controller (218392)
--Controller for Mud Ring (Monstrous Mudwalker)
--poeartha

function event_spawn(e)
	started = false;
	eq.unload_encounter("Mud_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started then	
			started = true;
			eq.load_encounter("Mud_Event");
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		eq.unload_encounter("Mud_Event");
	end
end
