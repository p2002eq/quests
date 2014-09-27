function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 2000, e.self:GetX() + 2000, e.self:GetY() - 2000, e.self:GetY() + 2000,e.self:GetZ() - 200, e.self:GetZ() + 1);
end

function event_enter(e)
	e.other:MovePC(10,-1570,-25,20,231);
end
