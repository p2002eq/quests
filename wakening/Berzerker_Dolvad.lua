function event_spawn(e)
	eq.set_timer("onset2", 55000); -- set timer for 24 hours
end

function event_timer(e)
    e.self:MoveTo(4310,-741,-183,-1,1);
    eq.stop_timer(e.timer)
end

function event_signal(e)
    if(e.signal == 1) then --vs died
        -- quest::start(25);
    end
end