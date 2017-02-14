-- Event controller (162266) in Ssra

function event_spawn(e)
	reset();
end

function event_signal(e)
	-- bitwise signal values for the 10 kills
	if e.signal < 10000 then
		local qglobals = eq.get_qglobals(e.self);
		if qglobals['cursed'] == nil then
			signal_total = e.signal;
			eq.set_global('cursed', 'started', 2, 'H1');
		else
			signal_total = signal_total + e.signal;
		end
		eq.zone_emote(1, 'Total is ' .. signal_total)
		
		if signal_total == 1023 then
			if qglobals['cursed_progress'] == nil then
				eq.zone_emote(1, 'GLYPHED SPAWNED')
				eq.unique_spawn(162505, 0, 0, -38, -10, -222); -- spawn glyphed
				reset();
			elseif tonumber(qglobals['cursed_progress']) < 3 then
				eq.zone_emote(1, 'GLYPHED SPAWNED')
				eq.unique_spawn(162508, 0, 0, -38, -10, -222); -- spawn runed
				reset();
			else
				reset();
			end
		end
	end		
end

function reset()
	signal_total = 0;
	eq.delete_global('cursed');
end