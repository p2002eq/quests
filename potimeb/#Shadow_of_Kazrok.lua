--#Shadow_of_Kazrok (223244)
--Phase 1 - Kazrok of Fire Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #fire_trigger that I died
	eq.signal(223173,2);
end