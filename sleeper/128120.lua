local spawnedMobs = 0;

function event_combat(e)
    if(e.joined) then
        eq.set_timer("spawn",120000);
    else
        eq.stop_timer("spawn");
        eq.depop_all(128110);
    end
end

function event_timer(e)
	if (e.timer == "spawn") then
	    eq.stop_timer("spawn");
	    eq.spawn2(128110,28,0,e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),253.2);
	    eq.spawn2(128110,29,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),253.2);
	    spawnedMobs = spawnedMobs + 2;
	    if (spawnedMobs < 8) then
	        eq.set_timer("spawn",120000);
	    end
	end
end

function event_death_complete(e)
    eq.stop_timer("spawn");
    eq.depop_all(128110);
end
