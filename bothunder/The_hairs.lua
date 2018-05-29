--The_hairs (209100) in Bastion of Thunder (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if e.other:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 50 then	--calc distance for Z-axis check
		e.self:Emote("on your body stand on end with static electricity.");
		eq.depop_with_timer();
	end
end



