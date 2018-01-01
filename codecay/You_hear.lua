--You_hear (200217) in Crypt of Decay (FLAVOR)

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if e.other:GetZ() > -100 and e.other:GetZ() < -70 then
		e.self:Emote("the rapid chittering of maddened rats, the end is near.");
		eq.depop_with_timer();
	end
end
