--#Rallos_Zek_ (214052)
--Fake RZ and event trigger version

function event_spawn(e)	--Repop trigger mobs if they aren't already up (should only apply in event of failed encounter)

	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214056) then	--Decorin Berik (214056)
		eq.get_entity_list():GetSpawnByID(361190):Repop(1);
	end
	
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214057) then	--Decorin_Grunhork (214057)
		eq.get_entity_list():GetSpawnByID(361200):Repop(1);
	end
	
	local instance_id = eq.get_zone_instance_id();
	eq.delete_global(tostring(instance_id) .. "_rztw_event");
	
	eq.unload_encounter("rztw_event");	--unload encounter if not previously done
end