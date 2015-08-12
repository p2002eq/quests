function event_spawn(e)
	eq.set_timer("depop", 86400000); -- set timer for 24 hours
    
end

function event_timer(e)
    if(e.timer == "depop") then
        eq.stop_timer(e.timer)
        eq.depop();
    end
end