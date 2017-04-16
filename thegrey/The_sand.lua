-- The_sand (171005) in the Grey for rock trap mobs

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40);
end

function event_enter(e)
    local chance = math.random(1, 200);
	if e.other:Admin() < 100 and chance <= 100 then -- mobs spawn only 50% of the time (to make traps harder to identify) and only if player is not a GM
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
        
        local mob;
        if chance <= 50 then
            mob = 171077;
        elseif chance <= 100 then
            mob = 171078;
        end

		local spawned = eq.spawn2(mob, 0, 0, x, y, z, h);
        eq.set_timer('depop', 17 * 60 * 1000, spawned);
        
        e.self:Emote("at your feet explodes into violent motion!");
        eq.depop_with_timer();
	end
end
