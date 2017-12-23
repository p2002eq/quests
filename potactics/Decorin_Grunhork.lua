--Spawn Tallon Zek
function event_death_complete(e)
        eq.signal(214123, 214057, 0);
end

function event_signal(e)
        --event time expired, depop with respawn timer.
        eq.depop_with_timer();
end

function event_spawn(e)
    trigger_up = eq.get_entity_list():IsMobSpawnedByNpcTypeID(214123); 
	
	if (not trigger_up) then
		eq.depop_with_timer();
	end
end

-- End of File  Zone: PoTactics  ID: 214057 -- Decorin_Grunhork