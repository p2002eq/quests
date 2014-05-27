function event_enter_zone(e)
	if(e.self:GetBoatID() == 770 or e.self:GetBoatID() == 771) then
		eq.signal(10016,1);
	else
		eq.signal(10016,2);
	end
end