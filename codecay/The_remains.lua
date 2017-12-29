--The_remains (200027) in Crypt of Decay (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if e.other:GetZ() > -80 and e.other:GetZ() < -60 then	--check Z-axis to prevent triggering from rat caves
		e.self:Emote("of a fresh sacrifice are littered across the altar.");
		eq.depop_with_timer();
	end
end


