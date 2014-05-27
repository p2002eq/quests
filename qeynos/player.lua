function event_enter_zone(e)
	if(e.self:GetBoatID() == 772 or e.self:GetBoatID() == 773) then
		eq.signal(1138,1);
	else
		eq.signal(1138,2);
	end
end