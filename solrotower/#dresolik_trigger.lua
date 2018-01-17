--#dresolik_trigger (212062)
--Control NPC to spawn #The_Protector_of_Dresolik (212063)
--solrotower

function event_signal(e)
	if e.signal == 1 then
		local protectors = eq.get_entity_list():IsMobSpawnedByNpcTypeID(212046);	--check if any Guardian_of_Dresolik are up
		if not protectors then
			eq.unique_spawn(212063,0,0,616,1585,-155,64);	--#The_Protector_of_Dresolik (212063)
		end
	elseif e.signal == 2 then
		eq.depop_with_timer();
	end
end