--Icefang
local icefang = 0;

function event_signal(e)
	if (e.signal == 1161101) then
		-- start gridid 360 (Icefang travel path)
		eq.start(360);
	end

end

function event_waypoint_depart(e)
	if(e.wp == 2 and icefang == 0) then
		-- despawn Korrigain after pause next to him and start down rest of path
		eq.signal(116594, 116567);
		e.self:ModifyNPCStat("runspeed","2");
		e.self:SetRunning(true);
		icefang = 1
	elseif (e.wp == 21 and icefang == 1) then 
		e.self:Emote("sniffs the ground and growls.");
		icefang = 2
	elseif (e.wp == 22 and icefang == 2) then
		eq.set_timer("icefang", 6000000); -- 10 min reset timer
		eq.load_encounter("RingSix");
		icefang = 3
	elseif (e.wp == 23 and icefang == 3) then 
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116596)) then
			eq.attack_npc_type(116596);
		end
		icefang = 0
	end

end

function event_timer(e)
	if (e.timer == "icefang") then
		eq.stop_timer("icefang");
		eq.unload_encounter("RingSix");
		eq.depop_all(116587);
		eq.depop_all(116596);
		--text made up
		e.self:Emote("blends into the snowy landscape and disappears from sight.");
		icefang = 0
		eq.depop_with_timer();
	end
end

function event_death_complete(e)
    eq.stop_timer("icefang");
    eq.unload_encounter("RingSix");
    eq.depop_all(116596);
    eq.depop_all(116587);
	icefang = 0
end


