--An_acidic_mist (207061) in Plane of Torment(FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if e.other:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 50 then	--calc distance for Z-axis check
		e.self:Emote("squirts from the porous walls that surround you!");
		eq.depop_with_timer();
	end
end



