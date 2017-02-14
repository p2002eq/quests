-- #Rhozth Ssrakezh (162258) for Cursed cycle - real one!

function event_spawn(e) 
	-- depop and deactivate fake Rhozth on pop
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(162509) then
		eq.set_timer('depop', 500);
	end
	eq.get_entity_list():GetSpawnByID(368763):Disable();
	
	eq.delete_global('cursed_progress'); -- resets cursed cycle
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.depop_with_timer(162509);
	end
end

function event_death_complete(e)
	eq.signal(162266, 512);
	local fake_spawn = eq.get_entity_list():GetSpawnByID(368763);
	fake_spawn:Enable();
	fake_spawn:Reset();
end
