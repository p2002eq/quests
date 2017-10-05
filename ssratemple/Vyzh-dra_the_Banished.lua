-- Vyzh`dra the Banished (162510) for Cursed cycle in Ssratemple
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

function event_slay(e)
	if e.other:IsClient() then
		e.self:Say('Remove that waste of flesh from my sight!')
	end
end

function event_combat(e)
	if e.joined then
		e.self:Shout('Bow before your only god! I will tear all others from the heavens!')
	end
end

function event_death_complete(e)
	local instance_id = eq.get_zone_instance_id();
	eq.stop_all_timers()
	e.self:Emote("'s corpse falls to the ground as new energy fills the room!")
	local qglobals = eq.get_qglobals(e.self);
	if tonumber(qglobals[instance_id .. '_cursed_progress']) == 2 then
		eq.unique_spawn(162507, 0, 0 , -38, -10, -222) -- spawn Vyzh`dra the Cursed
	else
	end
end
