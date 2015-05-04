function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
		e.self:Say("Such is the will of Cazic-Thule!");
	elseif(e.signal == 2) then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(72003);
		e.self:GMMove(mobtypeID:GetX(),mobtypeID:GetY(),mobtypeID:GetZ());
	end
end
