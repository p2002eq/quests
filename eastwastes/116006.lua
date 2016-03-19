-- Oracle of Rygorr cycle
function event_spawn(e)

	eq.set_timer("99",2);

end

function event_timer(e)
    -- Check to see if cheif is up
	local check_npc = eq.get_entity_list():GetMobByNpcTypeID(116584);

	if (e.timer == "99") and (check_npc == true) then
		eq.stop_timer("99");
		eq.set_timer("92", 1000000); --16.66 Min
	elseif (e.timer == "99") then
		eq.stop_timer("99");
	elseif (e.timer == "92") then
		eq.depop_all(116006);
	end

end
