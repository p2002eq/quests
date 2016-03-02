function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Heres some bread, don't starve....but I did pee on it");
        e.self:CastSpell(2198, e.other);
    end
end

