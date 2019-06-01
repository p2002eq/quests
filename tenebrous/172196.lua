-- a_coterie_general (172196)
--spawned adds as part of Vampyre Troubles quest
--tenebrous

function event_spawn(e)
    eq.set_timer("depop", 600000)
end


function event_timer(e)
    if (e.timer == "depop") then
        eq.depop();
    end
end
