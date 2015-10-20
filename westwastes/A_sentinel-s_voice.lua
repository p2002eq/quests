function event_spawn(event)
    xloc = e.self:GetX();
    yloc = e.self:GetY();
    zloc = e.self:GetZ();
    
    eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(event)
    e.self:Emote("invades your thoughts: 'Beware mortal!  This land is marked by Veeshan, and is sacred to her brood.  None but Dragonkin are welcome here.  Your life is forteit if you proceed.  Ignore this message at your peril!'");
end