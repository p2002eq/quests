---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Zevfeer",3600000);
end

function event_timer(e)
    if (e.timer == "Zevfeer") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end