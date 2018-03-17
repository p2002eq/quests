function event_spawn(e)
	eq.set_timer("1", 320000); --Say speech every 5 minutes
end

function event_timer(e)
	e.self:Say("Sir, you said Royt face. Guard Royt is just on the other side of this wall!");
end
