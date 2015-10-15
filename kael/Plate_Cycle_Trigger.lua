function event_spawn(e)
    e.self:Say('Foo');
    xloc = e.self:GetX();
    yloc = e.self:GetY();
    zloc = e.self:GetZ();
    eq.enable_proximity_say();
    eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
    e.self:Say('Bar');
end

function event_proximity_say(e)
    if(e.message:findi('The dain shall be slain for the peace we must obtain')) then
        e.self:Say('worked');
    end
end
