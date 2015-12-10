function event_spawn(e)
	eq.set_timer("90", 1000000); --16.67 min
end

function event_timer(e)
	if (e.timer == "90") then
		eq.depop_all(116556);
	end

end
