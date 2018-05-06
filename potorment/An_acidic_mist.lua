--An_acidic_mist (207061) in Plane of Torment(FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 35, xloc + 35, yloc - 35, yloc + 35, zloc - 20, zloc + 20);
end

function event_enter(e)
	e.self:Emote("squirts from the porous walls that surround you!");
	eq.depop_with_timer();
end



