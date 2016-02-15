local combatStarted = false;
local spawnedMobs = 0;

function event_combat(e)
    e.self:Say("testing this cycle");
    if(combatStarted == true) then 
        e.self:Say("combat ended");
        combatStarted = false;
        --despawn_cycle();
    elseif(combatStarted == false)
        e.self:Say("combat started");
        combatStarted = true;
        start_cycle(e);
    end
end

function start_cycle(e)
    e.self:Say("start cycle");
    eq.set_timer("spawn",120000);
	--eq.depop_with_timer();
end

function event_timer(e)
	if (e.timer == "spawn") then
	    e.self:Say("spawning mobs");
	   -- eq.spawn2(128110,28,0,e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),126.6);
	   -- eq.spawn2(128110,29,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),126.6);
	    --spawnedMobs = spawnedMobs + 2;
	    --if (spawnedMobs < 8)
	     --   eq.set_timer("spawn",120000);
	    --end
	end
end