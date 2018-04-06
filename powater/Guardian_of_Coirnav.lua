--Guardian_of_Coirnav (216053)
--Trigger for Coirnav Encounter
--powater

function event_spawn(e)
	eq.unload_encounter("Coirnav_Event");
	eq.set_timer("coirnav",2 * 1000);	--slight delay on spawn
	eq.unique_spawn(216048,0,0,-859,1095,-505,138);	--spawn #Coirnav_the_Avatar_of_Water (216048)
end

function event_timer(e)
	eq.stop_timer(e.timer);
	eq.unique_spawn(216048,0,0,-859,1095,-505,138);	--spawn #Coirnav_the_Avatar_of_Water (216048)
end

function event_death_complete(e)
	eq.load_encounter("Coirnav_Event");
end
