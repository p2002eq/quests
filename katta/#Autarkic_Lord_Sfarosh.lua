---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Sfarosh",740000);
end

function event_timer(e)
    if (e.timer == "Sfarosh") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end