function event_spawn(e)

	eq.set_timer("99",2);

end

function event_timer(e)

	local check_npc = eq.get_entity_list():GetMobByNPCType(116577);

	if (e.timer == "99") and (check_npc == true) then
		eq.stop_timer("99");
		eq.set_timer("92", 1000000); --16.66 Min
	elseif (e.timer == "99") then
		eq.stop_timer("99");
	elseif (e.timer == "92") then
		eq.depop_all(116006);
	end

end
