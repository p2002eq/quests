---- Quest:Vampyre Troubles
function event_combat(e)
    if(e.joined == true) then
        e.self:Say("You have trespassed where you are not welcome! Prepare to face your punishment!");
    end
end

function event_signal(e)
    local qglobals = eq.get_qglobals();
    if(e.signal == 1) then
        e.self:Say("Fool!! You know not what you have released upon us!! Nathyn will have your heads for this!!");
        eq.attack(qglobals.kshade_combat);
    end
end