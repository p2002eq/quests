function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 5, xloc + 5, yloc - 5, yloc + 5);
end

function event_enter(e)
	e.other:MovePC(31,-485,-476,73);
end