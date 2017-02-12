-- A massive burrower for The Burrower Beast event

function event_spawn(e)
	eq.set_proximity(e.self:GetX()-50,e.self:GetX()+50,e.self:GetY()-50,e.self:GetY()+50);
end

function event_enter(e)
	e.self:Attack(e.other);
	e.self:Attack(e.other);
	e.self:Attack(e.other);
	e.self:Attack(e.other);
end
