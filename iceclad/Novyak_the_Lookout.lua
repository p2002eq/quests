function event_spawn(e)
	eq.set_timer("1", 2400); -- set timer for 24 hours
end

function event_timer(e)
    if(e.timer == "1") then
        eq.stop_timer(e.timer)
        e.self:Say("Guys, can I get down now please?");
    end
end