--Gutripping_War_Beast (223146)
--Phase 2 Mini-boss
--potimeb

function event_death_complete(e)
	--signal phase_two_controller
	eq.signal(223242,1);
end
