---- Quest:Vampyre Troubles
function event_combat(e)
    if(e.joined == true) then
        e.say:Self("You have trespassed where you are not welcome! Prepare to face your punishment!");
    end
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Fool!! You know not what you have released upon us!! Nathyn will have your heads for this!!");
        local qglobals = eq.get_qglobals();
        eq.attack(qglobals.autarkic_combat);
    end
end