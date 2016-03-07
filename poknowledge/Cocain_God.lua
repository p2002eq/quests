function event_say(e)
    if(e.message:findi("Hail")) and (e.other:HasItem(13078) == false) then
        e.self:Say("Heres some bread, Now leave me alone!");
        e.other:SetRace(12);
        e.other:SummonItem(13078, 20);
        --e.self:CastSpell(2198, e.other);
    end
end

