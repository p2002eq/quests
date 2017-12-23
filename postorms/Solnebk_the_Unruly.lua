--Notifies Gurebk_Lord_of_Krendic that npc was killed in the camp.

function event_death_complete(e)
	eq.signal(210178,0);
end