--Guardian_of_Doomfire (217050)
--Trigger for Fennin Encounter
--pofire

function event_spawn(e)
	eq.unload_encounter("Fennin_Event");
end

function event_death_complete(e)
	eq.load_encounter("Fennin_Event");
end
