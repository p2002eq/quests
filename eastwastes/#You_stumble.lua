myX = nil;
myY = nil;
myZ = nil;
exists = nil;

function event_spawn(e)
	myX = e.self:GetX();
	myY = e.self:GetY();
	eq.set_proximity(myX - 50, myX + 50, myY -50, myY + 50);
end

function event_enter(e)
	myX = e.self:GetX();
	myY = e.self:GetY();
	myZ = e.self:GetZ();
	exists = eq.get_entity_list():GetMobByNpcTypeID(116601); -- Tanik Greskil

	if (exists == false) then
		e.self:Emote("in the snow.");
	else 
		e.self:Emote("and uncover the body of an injured coldain.");
		eq.spawn2(116601,0.0, 0, myX, myY, myZ, 0); -- Tanik Greskil
		eq.depop_with_timer();
	end
end
