function event_enter_zone(e)
    local qglobals = eq.get_qglobals(e.self);
    if(tonumber(qglobals.FrogDeath) == 1) then
        e.self:Kick();
    end
    e.self:MovePC(185,-436.45,604,-87.1,62);
    e.self:Message(14,"Your race is not destined for this world. You have been banished here, you have 3 minutes to make your peace, you will no longer be able to return to this world.");
    eq.set_timer("FrogDeath", 1000);
end

function event_timer(e)
    if(e.timer == "FrogDeath") then
        eq.set_global("FrogDeath","1",0,"F");
        e.self:Kick();
    end
    eq.stop_timer(e.timer)
end