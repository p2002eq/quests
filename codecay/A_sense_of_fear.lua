--A_sense_of_fear (200219) in Crypt of Decay (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30, zloc - 10, zloc + 10);
end

function event_enter(e)
	e.self:Emote("comes over you as you travel deeper into the crypt.");
	eq.depop_with_timer();
end



