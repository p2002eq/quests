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
	 
 


function event_death_complete(e)
	e.self:Emote("'s corpse explodes in a rain of feathers and blood!");
end
 

-- End of File  Zone: PoTorment  ID: 207065  -- #Sorrowsong
-- Targetable version