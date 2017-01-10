function event_spawn(e)
	eq.set_proximity(e.self:GetX()-20,e.self:GetX()+20,e.self:GetY()-20,e.self:GetY()+20);
end

function event_enter(e)
	e.self:Say("Begone intruder!");
	e.other:SpellFinished(2129, e.other);
end