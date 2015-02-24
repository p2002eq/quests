function event_enter_zone(e)
	local qglobals = eq.get_qglobals();
	
	if(e.self:GetBoatID() == 770 or e.self:GetBoatID() == 771) then
		eq.signal(69078,1);
	else
		eq.signal(69078,2);
	end
	
	if(qglobals.strongbox ~= nil) then
		eq.create_ground_object(13860, -9200, -430, -293, 0, 3000000);
		eq.delete_global("strongbox");
	end
end
