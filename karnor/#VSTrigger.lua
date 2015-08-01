function event_signal(e)
    --eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --vs died
        eq.set_timer("VSR", 86400000); -- set timer for 24 hours
    end
end

function event_timer(e)
    if(e.timer == "VSR") then
        eq.stop_timer(e.timer)
        eq.unique_spawn(102099,0,0,-559,-77,19); --spawn vsr
    end
end
