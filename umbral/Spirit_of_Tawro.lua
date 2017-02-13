-- Spirit of Tawro (176214) in Umbral

function event_spawn(e)
	local respawn = eq.get_entity_list():GetSpawnByID(357129):RespawnTimer() -- get curent respawn time of Tawro's spawnpoint
	eq.set_timer('depop', respawn * 1000)
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.depop()
	end
end
