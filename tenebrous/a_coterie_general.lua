---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("acg", 100000)
end

function event_timer(e)
    if (e.timer == "acg") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end