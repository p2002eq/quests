--#nemesis_of_stone (201492)
--Trial of Stoning
--pojustice

function event_death_complete(e)
	eq.signal(201505,9);	--event mob kill to #Event_Stoning_Control (201505)
end
