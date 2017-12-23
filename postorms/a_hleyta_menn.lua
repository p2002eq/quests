--Notifies Jeplak_Lord_of_Srerendi that npc was killed in the camp.

function event_death_complete(e)
	eq.signal(210179,0);
end