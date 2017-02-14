---- Quest:Rakshasa Skulls
function event_spawn(e)
    eq.set_timer("reanimated", 700000); -- 10 minutes to kill all mobs
end

function event_timer(e)
    if (e.timer == "reanimated") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end