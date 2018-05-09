--Force corpses at the zone-in to appear dead. Adapted from the same script in PoTactics, credit to whoever.

--Submitted by Jim Mills

function event_spawn(e)
	eq.set_timer("timer", 5 * 1000);
end

function event_timer(e)
	if e.timer == "timer" then
		e.self:SetAppearance(3);
		eq.stop_timer(e.timer);		
	end
end

