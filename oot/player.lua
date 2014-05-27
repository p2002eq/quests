function event_enter_zone(e)
	if(e.self:GetBoatID() == 770 or e.self:GetBoatID() == 771) then
		eq.signal(69078,1);
	else
		eq.signal(69078,2);
	end
end	