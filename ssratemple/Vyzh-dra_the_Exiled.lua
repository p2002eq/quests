-- Vyzh`dra the Exiled (162506) for Cursed cycle in Ssratemple
-- the script counts up increments of 10 seconds that are spent out of combat to reach the 25-min 'unengaged' time limit

function event_spawn(e)
	total_time = 0
	eq.set_timer('incr', 10 * 1000)
end

function event_timer(e)
	if e.timer == 'incr' and not e.self:IsEngaged() then
		total_time = total_time + 1
		if total_time >= 150 then
			eq.stop_timer(e.timer)
			eq.depop()
		end
	end
end

function event_death_complete(e)
	eq.stop_all_timers()
	e.self:Emote("'s corpse falls to the ground as new energy fills the room!")
	eq.set_global('cursed_progress', '2', 3, 'D8')
	eq.unique_spawn(162507, 0, 0 , -38, -10, -222) -- spawn Vyzh`dra the Cursed
end
