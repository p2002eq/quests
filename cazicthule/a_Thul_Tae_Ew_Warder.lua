function event_spawn(e)
	eq.set_proximity(e.self:GetX()-40,e.self:GetX()+40,e.self:GetY()-40,e.self:GetY()+40);
end

function event_enter(e)
	e.other:SpellFinished(2129, e.other);
end