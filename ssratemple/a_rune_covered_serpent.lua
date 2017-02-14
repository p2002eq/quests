-- a rune covered serpent (162508) for Cursed cycle in Ssratemple
-- the script counts up increments of 10 seconds that are spent out of combat to reach the 30-min 'unengaged' time limit

function event_spawn(e)
	total_time = 0
	eq.set_timer('incr', 10 * 1000)
end

function event_timer(e)
	if e.timer == 'incr' and not e.self:IsEngaged() then
		total_time = total_time + 1
		if total_time >= 180 then
			eq.stop_timer(e.timer)
			eq.depop()
		end
	end
end

function event_death_complete(e)
	eq.stop_all_timers()
	e.self:Emote("'s corpse rips in two, revealing a greater terror!")
	local qglobals = eq.get_qglobals(e.self);
	if tonumber(qglobals['cursed_progress']) == 1 then
		eq.unique_spawn(162506, 0, 0 , -38, -10, -222) -- spawn Vyzh`dra the Exiled if he hasn't been killed in this cycle
	elseif qglobals['cursed_progress'] < 3 then
		eq.unique_spawn(162510, 0, 0 , -38, -10, -222) -- spawn Vyzh`dra the Banished if Exiled has been killed
	else
	end
end
