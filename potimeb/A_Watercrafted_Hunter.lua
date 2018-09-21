--A_Watercrafted_Hunter (223153)
--Phase 2 
--potimeb

function event_death_complete(e)
	--signal phase_two_controller
	eq.signal(223242,1);
end
