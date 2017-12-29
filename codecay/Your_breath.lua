-- Your_breath (171061) in the Grey (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
    e.self:Emote("catches as you step into airless space.");
    eq.depop_with_timer();
end
