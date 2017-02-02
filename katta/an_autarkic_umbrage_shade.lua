---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("shade",740000);
    eq.attack(e.other:GetName());
end

function event_timer(e)
    if (e.timer == "shade") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end