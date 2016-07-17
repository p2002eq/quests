function event_death_complete(e)
	if (math.random(100) <= 10) then	-- 10% chance for ooze to spawn
		eq.spawn2(48349,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),128);
	end
end

function event_spawn(e)
	e.self:Say("spawned");
end