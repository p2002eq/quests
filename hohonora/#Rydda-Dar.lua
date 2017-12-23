function event_spawn(e)
	eq.set_timer("depop",2*60*60*1000);	--2hr timer
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.update_spawn_timer(211051,86400000); --trydan Faye 24h on fail
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(218068,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--planar projection
	eq.update_spawn_timer(211051,259200000); --trydan Faye 3 days on win
end