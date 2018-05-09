--Decorin_Grunhork (214057)
--Rallos Zek event trigger
--potactics

function event_death_complete(e)
	rallos = eq.get_entity_list():IsMobSpawnedByNpcTypeID(214052); 	--RZ untargetable version
	berik = eq.get_entity_list():IsMobSpawnedByNpcTypeID(214056); 	--Decorin_Berik (214056)

	if rallos and not berik then
		eq.load_encounter("rztw_event");
	end
end
