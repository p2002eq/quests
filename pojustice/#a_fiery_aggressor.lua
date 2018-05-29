--#a_fiery_aggressor (201473)
--Trial of Flame
--pojustice

function event_spawn(e)
	eq.move_to(880,-730,57,-1,true);	--move to center post
	eq.set_timer("monitor",1 * 1000);
end

function event_timer(e)
	if e.timer == "monitor" and e.self:GetX() == 880 and e.self:GetY() == -730 then
		eq.stop_timer(e.timer);
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 200, "Flames burst forth from the stake!")
		eq.set_timer("depop", 60 * 1000);
	elseif e.timer == "depop" then
		eq.signal(201502,2);	--event failed signal to #Event_Flame_Control (201502)
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(201502,9);	--event mob kill to #Event_Flame_Control (201502)
end

