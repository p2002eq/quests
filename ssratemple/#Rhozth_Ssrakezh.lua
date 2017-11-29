-- #Rhozth Ssrakezh (162258) for Cursed cycle - real one!

function event_spawn(e) 
	local instance_id = eq.get_zone_instance_id();
	eq.spawn_condition('ssratemple', 0, 10, 1) -- depop and deactivate fake Rhozth on pop
	eq.delete_global(instance_id .. '_cursed_progress'); -- resets cursed cycle
end

function event_death_complete(e)
	eq.signal(162266, 512);
	eq.spawn_condition('ssratemple', 0, 10, 2)
end
