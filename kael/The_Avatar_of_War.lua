local timerUp = false;      -- Determines if AOW despawn timer is up.

function event_spawn(e)
	e.self:Shout("Who dares defile my temple?! Come forth and face me!");
	-- eq.set_timer("AOW",60000000);   -- 1 hour
	eq.set_timer("AOW",600000);   -- 1 minute for testing.
end

function event_combat(e)
    if (e.joined == false) then
        eq.stop_timer("AOW");
        if (timerUp) then
            e.self:Say("Despawn from timer");
            eq.depop_all(113627);
        end
    end
end

function event_timer(e)
    if (e.timer == "AOW") then
        timerUp = true;
    end
end