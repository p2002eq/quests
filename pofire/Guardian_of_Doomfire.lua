--Guardian_of_Doomfire (217050)
--Trigger for Fennin Encounter
--pofire

function event_spawn(e)
	eq.unload_encounter("Fennin_Event");
	eq.delete_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent");
end

function event_death_complete(e)
	eq.set_global(eq.get_zone_instance_id() .. "_PoFire_FenninEvent","Phase1",3,"D3");
	eq.load_encounter("Fennin_Event");
end
