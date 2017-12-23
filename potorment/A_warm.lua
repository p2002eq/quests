function event_spawn(e)
  eq.set_proximity(e.self:GetX() - 21, e.self:GetX() + 21, e.self:GetY() - 100, e.self:GetY() + 100, e.self:GetZ() - 50, e.self:GetZ() + 50);
end

function event_enter(e)
	local instance_id = eq.get_instance_id();
	e.other:MovePCInstance(207, instance_id, -16, -49, 452);
end

function event_signal(e)
	eq.depop();
end

