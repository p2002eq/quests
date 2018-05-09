--Spectre of Corruption

function event_spawn(e)
	eq.unload_encounter("Bertoxx_Event");
end

function event_death_complete(e)
	eq.load_encounter("Bertoxx_Event");
end