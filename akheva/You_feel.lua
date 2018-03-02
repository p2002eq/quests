-- You_feel () in Akheva - trap

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
    local chance = math.random(1, 200);
	if e.other:Admin() < 100 and chance <= 100 then -- mobs spawn only 50% of the time (to make traps harder to identify) and only if player is not a GM
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
        
        for i=1, math.random(1,3) do
            local spawned = eq.spawn2(179346, 0, 0, x + math.random(-5,10.0, y + math.random(-5, 5), z, h);
            eq.set_timer('depop', 30 * 60 * 1000, spawned);
        end
        
        e.self:Emote("something trying to crawl up your leg...");
        eq.depop_with_timer();
	end
end
