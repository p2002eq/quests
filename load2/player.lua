function event_enter_zone(e)
    local qglobals = eq.get_qglobals(e.self);
    if(tonumber(qglobals.FrogDeath) == 1) then
        e.self:Kick();
    end
    e.self:MovePC(185,-436.45,604,-87.1,124);
    e.self:Message(14,"Your race is not destined for this world. You have been banished here, you have 3 minutes to make your peace, you will no longer be able to return to this world.");
    eq.set_timer("FrogDeath", 1000); -- 1 Sec
end

function event_timer(e)
    if(e.timer == "FrogDeath") then
        e.self:Message(13,"Frogloks are not an allowed race. Please log off and delete the character. If you are found to be attempting to circumvent this lockout you will be actioned.");
        eq.set_timer("FrogDeath2", 30000); -- 30 Sec
        eq.set_timer("FrogDeath3", 180000); -- 3 Min
    elseif(e.timer == "FrogDeath2") then
        e.self:Message(13,"Frogloks are not an allowed race. Please log off and delete the character. If you are found to be attempting to circumvent this lockout you will be actioned.");
        eq.set_timer("FrogDeath2", 30000); -- 30 Sec
    elseif(e.timer == "FrogDeath3") then
        eq.set_global("FrogDeath","1",0,"F");
        e.self:Kick();
    end
    eq.stop_timer(e.timer)
end
