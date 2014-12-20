function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	e.self:Emote("erupts in a cloud of spores!");
	eq.spawn2(11000,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.depop_with_timer();
end
