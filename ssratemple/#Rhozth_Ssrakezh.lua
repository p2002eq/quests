-- #Rhozth Ssrakezh (162258) for Cursed cycle - real one!

function event_spawn(e) 
	-- depop and deactivate fake Rhozth on pop
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(162509) then
		eq.set_timer('depop', 500);
	end
	
	eq.delete_global('cursed_progress'); -- resets cursed cycle
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.spawn_condition('ssratemple', 0, 10, 1)
	end
end

function event_death_complete(e)
	eq.signal(162266, 512);
	eq.spawn_condition('ssratemple', 0, 10, 2)
end
