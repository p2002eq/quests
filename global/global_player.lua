function event_enter_zone(e)
	local zoneid = eq.get_zone_id();
	local airplanekey ={20915,20914,20913,20917,20911,20912,20916,20918};
	
	if(zoneid ~= 71) then
		for i = 1, 8 do
			if(e.self:HasItem(airplanekey[i])) then
				e.self:NukeItem(airplanekey[i]);
			end
		end
	else
		e.self:BuffFadeAll(false);
	end
end