function event_enter_zone(e)
	if(e.self:GetBoatID() == 772 or e.self:GetBoatID() == 773) then
		eq.signal(98036,1);
	else
		eq.signal(98036,2);
	end
end