--An_overwhelming (200078) in Crypt of Decay (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if e.other:GetZ() > -80 and e.other:GetZ() < -60 then
		e.self:Emote("stench assaults your senses as you move closer to your doom.");
		eq.depop_with_timer();
	end
end



