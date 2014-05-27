function event_enter_zone(e)
	if(e.self:GetBoatID() == 772 or e.self:GetBoatID() == 773) then
		eq.signal(24056,3);
	else
		eq.signal(24056,4);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:SetBoatID(772);
		e.self:SetBoatName("Sea_King000");
	elseif(e.signal == 2) then 
		e.self:SetBoatID(773);
		e.self:SetBoatName("Golden_Maiden000");
	end
end