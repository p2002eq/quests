function event_spawn(e)
    eq.set_timer("spawn", 5)
end

function event_timer(e)
    if (e.timer == 'spawn') then
        xloc = e.self:GetX();
        yloc = e.self:GetY();
        zloc = e.self:GetZ();
        eq.enable_proximity_say();
        eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
    end
end

function event_proximity_say(e)
    if(e.message:findi('The dain shall be slain for the peace we must obtain')) then
        eq.spawn2(113636, 0, 0, 1125, -839.0, -120.80, 70);
        eq.depop_with_timer();
    end
end
