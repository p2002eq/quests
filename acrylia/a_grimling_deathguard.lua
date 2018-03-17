--a_grimling_deathguard
--Foreman_Gworknop Event
--Inner Acrylia 1.0

function event_death_complete(e)
	eq.signal(154407,1);	--signal to check for event start
end