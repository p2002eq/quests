function event_spawn(e)

	eq.set_timer("93", 1000000); --16.67 min

end

function event_timer(e)
	if (e.timer == "93") then
		eq.depop(116577);
	end

end
