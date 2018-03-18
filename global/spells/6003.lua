function event_spell_effect(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.target:CastToClient():GetForumName(e.target:CastToClient():AccountID());
	local globalName = forumName .. "-Banker";
	if (qglobals[globalName] == nil) then
		eq.spawn2(202363,0,0,e.target:CastToClient():GetX(), e.target:CastToClient():GetY(),e.target:CastToClient():GetZ(), e.target:CastToClient():GetHeading());
		eq.set_global(globalName ,"1",7,"H6");
	else
		e.target:Message(15,"It appears the traveling banker is away in another place.");	
	end
	return -1
end