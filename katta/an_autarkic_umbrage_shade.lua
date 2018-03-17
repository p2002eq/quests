---- Quest:Vampyre Troubles
function event_spawn(e)
    local qglobals = eq.get_qglobals();
    eq.set_timer("shade",740000);
    eq.attack(qglobals.autarkic_combat);
end

function event_timer(e)
    if (e.timer == "shade") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end