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
			eq.set_global('cursed', 'started', 2, 'M10');
		else
			signal_total = signal_total + e.signal;
		end
		
		if signal_total == 1023 then
			if qglobals['cursed_progress'] == nil then
				eq.set_timer('glyphed', math.random(5) * 1000)
			elseif tonumber(qglobals['cursed_progress']) < 3 then
				eq.set_timer('runed', math.random(5) * 1000)
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

function event_timer(e)
	eq.stop_timer(e.timer)
	if e.timer == 'glyphed' then
		eq.unique_spawn(162505, 0, 0, -38, -10, -222); -- spawn glyphed
		reset();
	elseif e.timer == 'runed' then
		eq.unique_spawn(162508, 0, 0, -38, -10, -222); -- spawn runed
		reset();
	end
end