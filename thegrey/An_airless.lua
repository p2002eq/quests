-- An_airless (171072) in the Grey (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
    e.self:Emote("void stretches out in front of you, seemingly devoid of life.");
    eq.depop_with_timer();
end
