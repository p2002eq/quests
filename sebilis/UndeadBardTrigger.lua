function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --vs died
        eq.set_timer("UDB", 86400000); -- set timer for 24 hours
    end
end

function event_timer(e)
    if(e.timer == "UDB") then
        eq.stop_timer(e.timer)
        eq.unique_spawn(89168,0,0,-559,-77,19); --spawn UDB
    end
end