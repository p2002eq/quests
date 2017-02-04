---- Quest:Vampyre Troubles
function event_combat(e)
    if(e.joined == true) then
        e.say:Self("You have trespassed where you are not welcome! Prepare to face your punishment!");
    end
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("What is all that noise!?"); -- adlib
        local qglobals = eq.get_qglobals();
        eq.attack(qglobals.autarkic_combat);
    end
end