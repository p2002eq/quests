--#priest_of_doom (201467)
--Trial of Execution
--pojustice

function event_death_complete(e)
	eq.signal(201469,0);	--signal #an_executioner (201469)
end