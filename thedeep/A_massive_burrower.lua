-- A massive burrower for The Burrower Beast event

function event_spawn(e)
	eq.set_proximity(e.self:GetX()-30,e.self:GetX()+30,e.self:GetY()-30,e.self:GetY()+30);
end

function event_enter(e)
	e.self:AddToHateList(e.other, 1);
end