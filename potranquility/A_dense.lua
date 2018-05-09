--A_dense (203000) in Plane of Tranquility (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	e.self:Emote("of incense smoke envelopes you as you enter the dark rooms.  The low murmur of meditative mantras reverberates throughout the building.  The elders are all in a meditative state.");
	eq.depop_with_timer();
end



