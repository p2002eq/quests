--Foreman_Gworknop (targetable version)
--Inner Acrylia 1.0

function event_death_complete(e)
	eq.signal(154407,2);	--signal to foreman_control for event to be reset
end