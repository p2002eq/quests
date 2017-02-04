---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("shade_fight", 600000); -- 10 minutes to kill
    local qglobals = eq.get_qglobals();
    eq.attack(qglobals.autarkic_combat);
end

function event_timer(e)
    if (e.timer == "shade_fight") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end