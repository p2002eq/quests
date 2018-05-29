--#Gallows_Master_Teion (201489)
--Trial of Hanging
--pojustice

function event_death_complete(e)
	eq.signal(201509, 1);	--signal #Event_Hanging_Control (201509) - WIN
end
