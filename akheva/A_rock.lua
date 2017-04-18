-- A_rock () in Akheva - trap

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
    local chance = math.random(1, 200);
	if e.other:Admin() < 100 and chance <= 100 then -- mobs spawn only 50% of the time (to make traps harder to identify) and only if player is not a GM
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
        
		local spawned = eq.spawn2(179347, 0, 0, x, y, z, h);
        eq.set_timer('depop', 30 * 60 * 1000, spawned);
        
        e.self:Emote("falls from the ceiling...");
        eq.depop_with_timer();
	end
end