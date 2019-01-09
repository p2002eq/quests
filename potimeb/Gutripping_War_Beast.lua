--Gutripping_War_Beast (223146)
--Phase 2 Mini-boss
--potimeb

function event_death_complete(e)
	--signal phase_two_controller
	eq.signal(223242,1);
	eq.set_global(eq.get_zone_instance_id() .. "_potimeb_p2_WarBeast","1",7,"H132");
end
