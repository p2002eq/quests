function event_spawn(e)
	eq.set_timer("speech", 480000); --say speech every 8 min

end

function event_timer(e)
	e.self:Say("Ok lads, remember what I taught you now. Thrust, block, slash...");
end
