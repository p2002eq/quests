--#Cazic_Thule (223166)
--Phase 5 God
--potimeb

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6);
	eq.set_global(eq.get_zone_instance_id() .. "_potimeb_p5_cazic","Dead",7,"H132");
end