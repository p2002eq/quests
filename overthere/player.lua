function event_click_door(e)
	local door_id = e.door:GetDoorID();
	if (door_id == 19) then
		
		if(e.self:HasItem(20600) and not e.self:HasZoneFlag(105)) then
			e.self:SetZoneFlag(105);
			eq.debug("Awarded zone flag.", 1);
		end
	end
end