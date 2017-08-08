function event_spawn(e)
    eq.set_timer('idle_chat', 1000);
end

function event_timer(e)
    eq.stop_timer(e.timer)
    if e.timer == 'idle_chat' then
        e.self:Emote("obviously has seen a great deal of traffic.");
        eq.set_timer('idle_chat', math.random(300, 600) * 1000);
    end
end
