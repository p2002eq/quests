--Check if any tempest toads still alive (210047)
--If none alive, spawn Drornok_Tok_Vo`Lok (210239) at -80,-190,-425,140 and despawn myself

function event_signal(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(210047) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(210239) then
		eq.spawn2(210239,0,0,-80,-190,-425,140); --Drornok_Tok_Vo`Lok
		eq.depop_with_timer();
	end
end

--Event by Chance - If you break it, you fix it!