--Avatar_of_the_Elements (223073)
--Phase 3 Final Boss 
--potimeb

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,4);
end