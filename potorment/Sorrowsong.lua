function event_spawn(e)
	eq.set_timer("timer", 1 * 1000);
	eq.set_timer("depop", 20 * 60 * 1000);
end

function event_timer(e)
	if (e.timer == "timer" and e.self:GetX() == 50 and e.self:GetY() == 0)  then
		e.self:CastSpell(3011,207052);
	elseif (e.timer == "timer" and e.self:GetX() == 50 and e.self:GetY() == -150) then 
		e.self:CastSpell(3011,207052);
	elseif (e.timer == "timer" and e.self:GetX() == -50 and e.self:GetY() == -150) then 
		e.self:CastSpell(3011,207052);
	elseif (e.timer == "timer" and e.self:GetX() == -50 and e.self:GetY() == 0) then 
		e.self:CastSpell(3011,207052);
	elseif (e.timer == "timer" and e.self:GetX() == 50 and e.self:GetY() == 0 ) then 
		e.self:CastSpell(3011,207052);
	elseif (e.timer == "depop") then
		eq.depop();
	end
end

function event_signal(e)
	if e.signal == 1 then
		eq.stop_timer("depop");
		eq.set_timer("depop", 20 * 60 * 1000);
	elseif e.signal == 2 then
		eq.stop_all_timers();
		eq.spawn2(207065,1,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

-- End of File  Zone: PoTorment  ID: 207052  -- Sorrowsong
-- non targetable