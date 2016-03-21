local corbin = 0;

function event_spawn(e)
    e.self:Say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
    e.self:SetRunning(true);
    eq.move_to(-2012, 197, 148);
    corbin = 10;
end