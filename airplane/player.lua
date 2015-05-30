function event_zone(e)
	local airplanekey ={20915,20914,20913,20917,20911,20912,20916,20918};
	
	for i = 1, 8 do
		if(e.self:HasItem(airplanekey[i])) then
			e.self:NukeItem(airplanekey[i]);
		end
	end
end

function event_enter_zone(e)
	e.self:BuffFadeAll(false);
end