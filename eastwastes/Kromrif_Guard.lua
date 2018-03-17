--Kromrif Guard
--zone: eastwastes

--script for Warden Bruke summon script

function event_spawn(e)
	e.self:MoveTo(-365, 320, 8, 0, true);
end

function event_signal(e)
	if (e.signal == 1) then
		eq.depop();
	end
end
