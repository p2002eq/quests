function event_spawn(e)
	e.self:SetAppearance(1);
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Emote("snores loudly");
	elseif (e.signal == 2) then
		e.self:Say("OWW!");
	elseif (e.signal == 3) then
		e.self:Say("Yes, Grand Historian Thoridain");
		eq.start(11); --Unknown function call but on perl
	end
end

function event_waypoint_arrive(e)
	if (e.wp == 5) then
		eq.stop();
		e.self:SetAppearance(1);
	end
end
