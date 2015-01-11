function event_enter_zone(e)
	if(e.self:Admin() < 100) then
	eq.depop_zone(true);
	end
end
