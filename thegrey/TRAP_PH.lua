-- TRAP_PH (171071) in the Grey for trap mobs

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
    local chance = math.random(1, 200);
	if e.other:Admin() < 100 and chance <= 100 then -- mobs spawn only 50% of the time (to make traps harder to identify) and only if player is not a GM
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
        
        local mob;
        if chance <= 20 then
            mob = 171073;
        elseif chance <= 40 then
            mob = 171074;
        elseif chance <= 60 then
            mob = 171076;
        elseif chance <= 78 then
            mob = 171077;
        elseif chance <= 96 then
            mob = 171078;
        elseif chance <= 98 then
            mob = 171081;
        elseif chance <= 100 then
            mob = 171086;
        end
        
        if chance > 60 and chance <= 96 then
            eq.local_emote({ x, y, z }, 0, 150, 'The sand at your feet explodes into violent motion!');
        else
            eq.local_emote({ x, y, z }, 0, 150, 'A creature of living stone leaps out at you from amongst the rocks!');
        end
        
		local spawned = eq.spawn2(mob, 0, 0, x, y, z, h);
        eq.set_timer('depop', 17 * 60 * 1000, spawned);
		eq.depop_with_timer()
	end
end
