function event_spawn(e)
	eq.set_timer("depop",2*60*60*1000);	--2hr timer
	e.self:Say("Fools!");
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(211074,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

