function event_spawn(e)
	eq.spawn_condition("oot",0,1,0);
	eq.spawn_condition("oot",0,2,0);
end

function event_signal(e)
	local count = eq.get_entity_list():CountClient();
	if(count == 1) then
		if(e.signal == 2) then
			eq.spawn_condition("oot",0,1,0);
			eq.spawn_condition("oot",0,2,0);
		end
	end			
end