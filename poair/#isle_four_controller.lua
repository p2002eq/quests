--#isle_four_controller (215427)
--Controller for Stormrider event
--poair

function event_spawn(e)
	started = false;
	ardent = false;
	eq.unload_encounter("Melernil_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started then	
			started = true;
			eq.load_encounter("Melernil_Event");
		end
		
		--Ardent Phoenix Check
		if not eq.get_entity_list():GetSpawnByID(365682):NPCPointerValid() and not ardent then
			ardent = true;
			eq.spawn2(215403,0,0,596,-670,446,80);	--#Ardent_Phoenix_of_Xegony (215403)
			eq.spawn2(215403,0,0,620,-688,446,20);	--#Ardent_Phoenix_of_Xegony (215403)
		end
	elseif e.signal == 2 then	--encounter reset/unload
		started = false;
		ardent = false;
		eq.unload_encounter("Melernil_Event");
	end
end
