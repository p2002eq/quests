local bossman = 0;

function event_signal(e)
	bossman = 1;
	eq.signal(211081,9,1);
end

function event_death_complete(e)
	eq.signal(211081,8,0);
	if bossman == 1 then
		eq.spawn2(202368,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.update_spawn_timer(211060,259200000); --Alekson Garn 3 days on win
		bossman= nil;
	end
end