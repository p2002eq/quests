local timerUp = false;      -- Determines if AOW despawn timer is up.

function event_spawn(e)
	e.self:Shout("Who dares defile my temple?! Come forth and face me!");
end

function event_combat(e)
    if (e.joined) then
       -- eq.set_timer("AOW",60000000);   -- 1 hour
        eq.set_timer("AOW",600000);   -- 1 minute for testing.
    else
        eq.stop_timer("AOW");
        if (timerUp) then
            eq.depop_all(113627);
        endif
    end
end

function event_timer(e)
    if (e.timer == "AOW") then
        timerUp = true;
    endif
end