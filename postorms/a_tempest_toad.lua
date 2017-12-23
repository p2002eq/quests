#Notifies Drornok_Trigger that a tempest toad was killed

function event_death_complete(e)
	eq.signal(210241,0);
end