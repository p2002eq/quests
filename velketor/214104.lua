function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 15, e.self:GetX() + 15, e.self:GetY() - 15, e.self:GetY() + 15, e.self:GetZ() -5, e.self:GetZ() +5);
end

function event_enter(e)
	instanceId = eq.get_zone_instance_id();
	if(instanceId ~= 0) then
		local global = e.other:CastToClient():GetForumName(e.other:CastToClient():AccountID()) .. "-Taian";
		eq.set_global(global,"99",7,"F");
		e.other:Message(15,"Congratulations, you have earned Taians approval. That was a rough ride, but you made it to the top!");
		e.other:MovePC(202,-213, -178, -157, 383.8);
	end
end
