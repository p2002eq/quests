-- NPCID: 209026 Agnarr_the_Storm_Lord

function event_spawn(e)
	eq.set_next_hp_event(76); --spawn first giant at 75%
end

function event_combat(e)
	eq.set_timer("depop",2*60*60*1000); --fail timer (2hrs)
	eq.set_timer("aggro",60*1000); --check for aggro
	eq.signal(209033,1,1); --portals start spawning
end

function event_hp(e)
	if (e.hp_event == 76) then
		eq.spawn2(209104,0,0,-888,-1623,2252,100); --first giant
		eq.set_next_hp_event(51); --spawn next giant at 50
		eq.set_next_inc_hp_event(98);
	elseif (e.hp_event == 51) then
		eq.spawn2(209105,0,0,-888,-1890,2252,9); --second giant
		eq.set_next_hp_event(26); --spawn next giant at 25
	elseif (e.hp_event == 26) then
		eq.spawn2(209106,0,0,-1017,-1717,2252,66); --third giant
	end
	
	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(76);
	end
end

function event_timer(e)
	if e.timer == "depop" then --took too long. fail
		eq.stop_timer(e.timer);
		eq.signal(209033,2,1); --portals stop spawning
		eq.depop_with_timer();
	elseif e.timer == "aggro" then
		if not e.self:IsEngaged() then
			eq.signal(209033,2,1); --if not aggro'd, stop portals from spawning
		end
	end
end

function event_death_complete(e)
	eq.spawn2(209114,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Planar Projection
	eq.spawn2(209108,0,0,-469,-1754,2351.2,197.6); --Karana upstairs
	eq.signal(209033,2,1); --stop portals from spawning
end