-- Spirit of Radir (176213) in Umbral

function event_spawn(e)
	local respawn = eq.get_entity_list():GetSpawnByID(357128):RespawnTimer() -- get curent respawn time of Radir's spawnpoint
	eq.set_timer('depop', respawn * 1000)
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.depop()
	end
end
