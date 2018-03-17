function event_signal(e)
    if (e.signal == 1) then
        e.self:Say("Squawk! Pieces of eight! Pieces of eight!");
        eq.signal(110053,1,4000);
    elseif (e.signal == 2) then
        e.self:Say("We be out. You'll be needin to make more. Arg!");
    elseif (e.signal == 101) then
        e.self:Say("Yar ye scruvy bearded dwarf, just over tha hill there.");
    end
end

