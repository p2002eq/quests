--Decorin_Berik (214056)
--Rallos Zek event trigger
--potactics

function event_death_complete(e)
	rallos = eq.get_entity_list():IsMobSpawnedByNpcTypeID(214052); 	--RZ untargetable version
	grunhork = eq.get_entity_list():IsMobSpawnedByNpcTypeID(214057); 	--Decorin_Grunhork (214057)

	if rallos and not grunhork then
		eq.load_encounter("rztw_event");
	end
end