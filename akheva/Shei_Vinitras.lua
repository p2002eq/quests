---- Event:Shei_Vinitras
--This version of Shei is a simple non-aggro merchant. When killed, the true version of Shei will spawn.

function event_death_complete(e)
	eq.load_encounter("Shei");	
end
