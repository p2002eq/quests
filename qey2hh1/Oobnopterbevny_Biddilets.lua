---- Quest:Researcher's Badge (Badge #3)

function event_spawn(e)
    eq.set_timer("shout", 600000);
    e.self:Shout("What a lovely diseased filled place! Tra la la.");
end

function event_timer(e)
    if (e.timer == "shout") then
        eq.stop_timer(e.timer)
        e.self:Shout("What a lovely diseased filled place! Tra la la.");
        eq.set_timer("shout", 600000)
    end
end