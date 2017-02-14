---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Selis", 700000);
end

function event_timer(e)
    if (e.timer == "Selis") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end