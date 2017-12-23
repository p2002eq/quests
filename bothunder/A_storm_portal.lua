function event_signal(e)
	if e.signal == 1 then
		eq.set_timer("adds",30*1000); --spawn adds every 30s
	elseif e.signal == 2 then
		eq.stop_timer("adds"); --stop spawning
		eq.set_timer("depop",20 * 60 * 1000);  --depop adds after 20 minutes
	end
end

function event_timer(e)
	if e.timer == "adds" then
		e.self:CastSpell(1037,209033);
		eq.spawn2(209107,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --spawn add
	elseif e.timer == "depop" then --20 minutes, depop all adds
		eq.stop_timer(e.timer);
		eq.depop_all(209107);
	end
end

