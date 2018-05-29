--a_tempest_toad (210047)
--Notifies Drornok_Trigger that a tempest toad was killed
--postorms

function event_death_complete(e)
	eq.signal(210478,0);	--#Drornok_trigger (210478)
end