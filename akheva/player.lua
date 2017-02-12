-- Shei event unload in Akheva (run on killing player)

function event_signal(e)
	if e.signal = 99 then
		eq.unload_encounter("Shei");
	end
end
