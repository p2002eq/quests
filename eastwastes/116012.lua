function event_spawn(e)
	eq.set_timer("98", 2);
end

function event_timer(e)
	local check_npc = eq.get_entity_list():GetMobByNPCTypeID(116577);

	if (e.timer == "98") and (check_npc == true) then
		eq.stop_timer("98");
		eq.set_timer("94", 1000000); --16.67 min
	elseif (e.timer == "98") then
		eq.stop_timer("98");
	elseif (e.timer == "94") then
		eq.depop_all(116012);
	end

end
