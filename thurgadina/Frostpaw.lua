
function event_spawn(e)
	eq.set_timer("follow", 1); --Keeps on checking every 1ms? I would set this to a longer follow seems like it would take up memory
end

function event_timer(e)
	if (e.timer == "follow") then
		if (eq.get_entity_list():IsMobSpawnedByNPCTypeID(115101)) then
			--Check if Wolfmaster is up and follow him
			e.self:follow(115101);
			eq.stop_timer("follow");
		end
	end
end
