function event_combat(e)
	if(e.self:Admin() < 100) then
	--eq.depop_zone(true);
	eq.depop();
	end
end
