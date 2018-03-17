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
		eq.set_timer("depop", 600000); -- 10 min reset timer
		spawn_orcs()
		icefang = 3
	elseif (e.wp == 23 and icefang == 3) then 
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116596)) then
			eq.attack_npc_type(116596);
		end
	end

end

function event_timer(e)
	if (e.timer == "depop") then
		--text made up
		e.self:Emote("blends into the snowy landscape and disappears from sight.");
		cleanup();
		eq.depop_with_timer();
	end
end

function event_death_complete(e)
    cleanup();
end

function cleanup()
	eq.stop_timer("icefang");
	eq.depop_all(116587);
	eq.depop_all(116596);
	icefang = 0;
end

function spawn_orcs()
	eq.spawn2(116596, 0, 0, -4446, -3350, 150, 148); --Poxbreath
	--always spawn at least 2	
	eq.spawn2(116587, 0, 0, -4398, -3354, 150, 382);
	eq.spawn2(116587, 0, 0, -4420, -3378, 150, 508);
	
	if (oracleSpawns == 3) then	
		eq.spawn2(116587, 0, 0, -4423, -3332, 150, 262);
	elseif (oracleSpawns == 4) then
		eq.spawn2(116587, 0, 0, -4404, -3373, 150, 452);
	end
end

