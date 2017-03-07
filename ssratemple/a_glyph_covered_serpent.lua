-- a glyph covered serpent (162505) for Cursed cycle in Ssratemple
-- the script counts up increments of 10 seconds that are spent out of combat to reach the 30-min 'unengaged' time limit

function event_spawn(e)
	eq.zone_emote(1, 'An odd smell of ozone permeates the air as a great serpent rises.')
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

function event_combat(e)
	if e.joined then
		e.self:Emote("roars and attacks!")
	end
end

function event_death_complete(e)
	eq.stop_all_timers()
	e.self:Emote("'s corpse rips in two, revealing a greater terror!")
	eq.set_global('cursed_progress', '1', 3, 'D8')
	eq.unique_spawn(162506, 0, 0 , -38, -10, -222) -- spawn Vyzh`dra the Exiled
end
