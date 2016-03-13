local timerUp = false;      -- Determines if AOW despawn timer is up.
local inCombat = false;

function event_spawn(e)
	e.self:Shout("Who dares defile my temple?! Come forth and face me!");
	--eq.set_timer("AOW",3600000);   -- 1 hour
	eq.set_timer("AOW",300000);   -- 1 minute for testing.
end

function event_combat(e)
    if (e.joined == false) then
        inCombat = false;
        eq.stop_timer("AOW");
        if (timerUp) then
            eq.depop_all(113627);
        end
    else
        inCombat = true;
    end
end

function event_timer(e)
    if (e.timer == "AOW") then
        if (inCombat) then
            timerUp = true;
        else
            eq.depop_all(113627);
        end
    end
end