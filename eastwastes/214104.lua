function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 20, e.self:GetX() + 20, e.self:GetY() - 20, e.self:GetY() + 20, e.self:GetZ() -5, e.self:GetZ() +5);
end

function event_enter(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Orb19";
	local num = qglobals[globalName];
	if (num == nil) then
		eq.set_global(globalName,"1",7,"F");
		e.other:Message(15,"While studying the orb, you find a relic!");
	end
end
