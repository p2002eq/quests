function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Heres some bread, don't starve....but I did pee on it");
        e.other:SummonItem(13078, 20);
    end
end

